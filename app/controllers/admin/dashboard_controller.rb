class Admin::DashboardController < AdminController
 authorize_resource :class => :dashboard
	
	def index
		@totalServices = Service.all.where(parent_id: nil).count
		@allUsers = User.all.count
		# byebug
		@cities = City.all.count
	end	
end
