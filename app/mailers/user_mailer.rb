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

end
