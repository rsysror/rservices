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

	# DELETE /User/1
  # DELETE /user/1.json
  def destroy
  	@user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User is successfully destroyed.' }
      format.json { head :no_content }
    end
  end


	# Method for partner listing
	def partners

	end	
	# Method to display the service request list of user
	def user_service_request
		@service_requests = User.find(params[:id]).service_requests.includes(:service,:address,:status, :portfolio, :time_slot).paginate(:page => params[:page], :per_page => 5)
	end	
	# Method to find the details of all registerd user and partner bassed on ID
	def get_users_details
		@user = User.includes(:addresses).find(params[:id])
		
	end
	def update_service_status
		if(ServiceRequest.find(params[:resquest_id]))
			ServiceRequest.find(params[:resquest_id]).update(status_id: 1)
			flash[:success] = "Service request accepted "
			redirect_to action: "index"
		else
			flash[:error] = "Service request not found!"
			redirect_to action: "index"
    end	
  end



	

end
