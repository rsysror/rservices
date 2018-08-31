class Admin::DashboardController < AdminController

	def index
		@totalServices = Service.all.where(parent_id: nil).count
		@allUsers = User.all.count
		# byebug
		@cities = City.all.count
	end	
end
