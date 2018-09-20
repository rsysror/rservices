class Admin::UsersController < AdminController
  load_and_authorize_resource
  before_action :users_details, only: [:show]
  before_action :status_value, only: [:update_service_status]
  before_action :get_user_detail, only: [:user_service_request,:partner_service_request, :destroy, :partner_details]
  before_action :params_page, only:[:user_service_request, :partner_service_request, :service_requests_list]
  layout 'admin'
  

  def index
    @users = User.get_users(:user, @page)
  end
  
  def new
  end

  def show ; end 

  def destroy
    if @user.destroy
      redirect_to @user.partner? ? admin_partners_path : admin_users_path, notice: 'User is successfully destroyed.' 
    end
  end

  # Method for partner listing
  def partners
    @users = User.get_users(:partner, @page)
  end 

  # Method to display the service request list of user
  def user_service_request
    @service_requests = @user.get_user_service_requests(@page)
  end

  # Method to display the partner's service request list of user
  def partner_service_request
    @service_requests = @user.get_partner_service_requests(@page)
  end

  # Method to display the partner's service request list of user
  def service_requests_list
    @service_requests = ServiceRequest.get_all_service_requests(@page)
  end 

  # Method to find the details of all registerd partner bassed on ID
  def partner_details
    @portfolio = @user.portfolio 
  end

  def manage_portfolio_status
    @users = User.get_users(:partner)
    @portfolio = @user.portfolio
    @portfolio.update_attribute(:status, params[:value])
  end

  #update status of users service request
  def update_service_status
    if(@service_request and @status)
      @service_request.update_attributes(status_id: @status.id)
      UserMailer.accepted_rejected(@service_request.user, @service_request).deliver_now
      flash[:success] = "Service request accepted "
      redirect_to admin_partners_path
    else
      flash[:error] = "Service request not found!"
      redirect_to admin_partners_path
    end 
  end

  private

  def status_value
    @status = Status.get_status_value(params[:status])
    @service_request = ServiceRequest.find(params[:request_id])
  end

  def get_user_detail
    @user = User.find(params[:id])
  end

  def users_details
    @user = User.get_user_details(params[:id])
  end

  def params_page
    @page = params[:page]
  end 
    
end
