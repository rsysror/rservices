namespace :send_notification_mail do

  desc "Send Pre Notification Mail"
  task :send_service_notification => :environment do
    service_requests = ServiceRequest.where('service_date BETWEEN ? AND ?', DateTime.now , DateTime.now + ENV['pre_notification_time'].to_i.hours)
    service_requests.each do |request|
      company = request.assignee_id.present? ? request.assigned_to : request.portfolio.user
      UserMailer.send_pre_service_notification_company(request.user, request, company).deliver_now
      p "============Notification Mail Sent to company============================"
      UserMailer.send_pre_service_notification_user(request.user, request, company).deliver_now
      p "============Notification Mail Sent to User============================"
    end
  end

end