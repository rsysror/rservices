module Admin::UsersHelper
	def users_city user
		user.addresses.map{|m| m.city.name}.join(', ')
	end	

#Method to get full name
	def get_full_name user
		"#{user.first_name}  #{user.last_name}"
	end	
end
