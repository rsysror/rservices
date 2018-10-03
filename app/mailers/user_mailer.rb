class UserMailer < ApplicationMailer

  def service_request_generate user, service_request, role
    @name = service_request.user.full_name
    @service_request_number = service_request.service_request_number
    
    mail(to: ((role == 'user') ? user.email : service_request.portfolio.user_email) , subject: "Service Request Generated", template_name: ((role == 'user') ? 'service_request_generate' : 'partner_service_request_generate' ))
  end

  def accepted_rejected user, service_request
    @name = service_request.user.full_name
    @service_request_number = service_request.service_request_number
    @status = service_request.status.name
    mail(to: service_request.user.email, subject: "Service Request", template_name:  'accepted_rejected')
  end

  def send_pre_service_notification_user(user, service_request, company)
    @user_name = user.full_name
    @comp_name = company.full_name
    @phone = company.phone
    @service_name = service_request.service_name
    @req_no = service_request.service_request_number
    @service_date = service_request.try(:service_date).strftime('%Y-%m-%d')
    @time = service_request.service_time
    mail(to: user.email, subject: "Service Request Notification")
  end

  def send_pre_service_notification_company(user, service_request, company)
    @comp_name = company.full_name
    @user_name = user.full_name
    @phone = user.phone
    @service_name = service_request.service_name
    @req_no = service_request.service_request_number
    @service_date = service_request.try(:service_date).strftime('%Y-%m-%d')
    @time = service_request.service_time
    mail(to: company.email, subject: "Service Request Notification")
  end

end
