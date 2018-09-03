class UserMailer < ApplicationMailer

	def service_request_generate user, service_request, role
    @name = user.first_name + user.last_name
    @service_request_number = service_request.service_request_number
    
    mail(to: ((role == 'user') ? user.email : service_request.portfolio.user_email) , subject: "Service Request Generated", template_name: ((role == 'user') ? 'service_request_generate' : 'partner_service_request_generate' ))
	end

end
