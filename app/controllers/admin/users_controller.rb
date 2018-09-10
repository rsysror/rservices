class Admin::UsersController < AdminController
	load_and_authorize_resource
	before_action :get_users_details, only: [:show]
	before_action  :get_status_value, only: [:update_service_status]
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
  	ridirect_url = (@user.has_role? :partner) ? admin_partners_url : admin_users_url
 	 	if @user.destroy
    	redirect_to ridirect_url, notice: 'User is successfully destroyed.' 
  	end
  end


	# Method for partner listing
	def partners
		@users = User.includes(:addresses).with_role(:partner)
	end	
	# Method to display the service request list of user
	def user_service_request
		@service_requests = User.find(params[:id]).service_requests.includes(:service,:address,:status, :portfolio, :time_slot).paginate(:page => params[:page], :per_page => 5)
	end	
	# Method to display the partner's service request list of user
	def partner_service_request
		@service_requests = User.find(params[:id]).portfolio.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).paginate(:page => params[:page], :per_page => 5)
	end	
	# Method to display the partner's service request list of user
	def service_requests_list
		@service_requests = ServiceRequest.all.where.not(portfolio_id: [nil, ""]).paginate(:page => params[:page], :per_page => 5)

	end	

	# Method to find the details of all registerd user 
	def get_users_details
		@user = User.includes(:addresses).find(params[:id])		
	end

	# Method to find the details of all registerd partner bassed on ID
	def partner_details
		#@user = User.find(params[:id]).portfolio.service_requests.includes(:service,:address,:status, :portfolio, :time_slot)	
		@user = User.find(params[:id])
		@portfolio = @user.portfolio 
	end



	#update status of users service request
	def update_service_status
		if(@service_request and @status)
			 @service_request.update_attributes(status_id: @status.id)
			flash[:success] = "Service request accepted "
			redirect_to admin_users_path
		else
			flash[:error] = "Service request not found!"
			redirect_to admin_users_path
    end	
  end


	private

	def get_status_value
		@status = Status.where(name: params[:status]).last
		@service_request = ServiceRequest.find(params[:request_id])
	end
	

end
