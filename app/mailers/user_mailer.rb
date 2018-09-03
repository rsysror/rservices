class UserMailer < ApplicationMailer

	def service_request_generate user, portfolio
    @name = user.first_name + user.last_name
    mail(to: user.email, subject: "Service Request Generated", template_name: 'service_request_generate')
    mail(:to => portfolio.user_email, subject: "Service Request Generated", template_name: 'service_request_generate')
	end

end
