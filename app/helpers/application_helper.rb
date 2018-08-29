module ApplicationHelper
	
	#fix this code with switch case
	def current_user_role user
    (user.has_role? :admin) ? "Admin" : ((user.has_role? :user) ? "User" : "Service Provider")
  end

	def service_select
		Service.all.collect {|u| [u.name, u.id]}
	end

end
