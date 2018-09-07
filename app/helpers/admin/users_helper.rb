module Admin::UsersHelper
	def users_city user
		user.addresses.map{|m| m.city.name}.join(', ')
	end	

#Method to get full name
	def get_full_name user
		"#{user.first_name}  #{user.last_name}"
	end	

  def admin_status_action request
	  if (request.status.try(:name) == "Pending")
	    link_to "Accept",update_service_status_admin_user_path(resquest_id: request.id),:data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },:class => 'btn btn-success', style: "color:#fff" 
   	end 
  end 


end
