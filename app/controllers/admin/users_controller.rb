class Admin::UsersController < AdminController
	load_and_authorize_resource
	before_action :get_users_details, only: [:show]
	layout 'admin'
  # GET /users
  def index
    @users = User.includes(:addresses).with_role(:user)
  end
  # GET /users/new
  def new
    
  end
  # Method to display the details of users
	def show

	end	


	# Method for partner listing
	def partners

	end	
	# Method to display the service request list of user
	def user_service_request

	end	
	# Method to find the details of all registerd user and partner bassed on ID
	def get_users_details
		@user = User.includes(:addresses).find(params[:id])
		#@user = @user.order(id: :desc)

	end



	

end
