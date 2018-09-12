class Admin::UsersController < AdminController
	load_and_authorize_resource
	before_action :get_users_details, only: [:show]
	before_action  :get_status_value, only: [:update_service_status]
	before_action :get_user_detail, only: [:user_service_request,:partner_service_request, :destroy, :partner_details]
	layout 'admin'
  

  def index
    @users = User.includes(:addresses).with_role(:user)
  end
  
  def new ; end

	def show ; end 

  def destroy
  	redirect_url = (@user.has_role? :partner) ? admin_partners_path : admin_users_path
 	 	if @user.destroy
    	redirect_to redirect_url, notice: 'User is successfully destroyed.' 
  	end
  end


	# Method for partner listing
	def partners
		@users = User.includes(:addresses).with_role(:partner)
	end	
	# Method to display the service request list of user
	def user_service_request
		@service_requests = @user.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => params[:page], :per_page => 5)
	end	
	# Method to display the partner's service request list of user
	def partner_service_request
		@service_requests = @user.portfolio.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => params[:page], :per_page => 5)
	end	
	# Method to display the partner's service request list of user
	def service_requests_list
		@service_requests = ServiceRequest.where.not(portfolio_id: [nil, ""]).paginate(:page => params[:page], :per_page => 5)

	end	

	# Method to find the details of all registerd partner bassed on ID
	def partner_details
		@portfolio = @user.portfolio 
	end

  def manage_portfolio_status
    @users = User.includes(:addresses).with_role(:partner)
    @portfolio = @user.portfolio
    @portfolio.update_attribute(:status, params[:value])
  end


	#update status of users service request
	def update_service_status
		if(@service_request and @status)
			 @service_request.update_attributes(status_id: @status.id)
			flash[:success] = "Service request accepted "
			redirect_to admin_partners_path
		else
			flash[:error] = "Service request not found!"
			redirect_to admin_partners_path
    end	
  end

	private

	def get_status_value
		@status = Status.where(name: params[:status]).last
		@service_request = ServiceRequest.find(params[:request_id])
	end

	def get_user_detail
		@user = User.find(params[:id])
	end

	def get_users_details
		@user = User.includes(:addresses).find(params[:id])
	end

	
end
