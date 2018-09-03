class UserMailer < ApplicationMailer

	def service_request_generate user
    @name = user.first_name + user.last_name
    mail(to: user.email, subject: "Service Request Generated")
	end

end
