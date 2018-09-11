class Admin::DashboardController < AdminController
 authorize_resource :class => :dashboard
	
	def index
		
	end	
	
end
