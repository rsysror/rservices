class ServiceRequestsController < ApplicationController
   before_action :authenticate_user!
   before_action :get_service_request, only: [:edit,:show, :update,:cancel_service_request]

  def index
    @service_requests = current_user.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @service_request =  current_user.service_requests.create(service_request_params)
    if @service_request.persisted?
      UserMailer.service_request_generate(current_user,@service_request, 'user').deliver_now
      UserMailer.service_request_generate(current_user,@service_request, 'partner').deliver_now
      flash[:success] = "Service Request Placed Successfully!"
      redirect_to '/service_requests'
    else
      flash[:error] = @service_request.errors.full_messages.join(",")
      redirect_to '/dashboard'
    end
      
  end

  def open_comment_pop_up
    @request_id = params[:id]
    @comments =  ServiceRequest.comments_list
  end

  def edit
    @cities = City.details
    @addresses = current_user.get_all_address_from_service_city(@service_request)
  end

  def show; end

  def update
    # need to look better solution
    if ( (params[:comment_popup] == "true") && ( params[:service_request][:comment] == '') )
      params[:service_request][:comment] = params[:service_request][:select_comment]
    end

    service_request = @service_request.update_attributes(service_request_update_params)
    if service_request
      if current_user.partner?
        redirect_to '/partner/dashboard'
      elsif current_user.employee?
        redirect_to '/employee'
      else
        redirect_to '/service_requests'
      end
    end
  end

  def cancel_service_request
    status = Status.where(name: 'Cancelled').last
    @service_request.update_attributes(status_id: status.id)
    redirect_to '/service_requests'
  end

  def get_services
    if params[:city_selection].present?
      @city = City.find(params[:city_selection])
      @addresses = @city.get_curent_user_address(current_user)
      @services = @city.get_services
    elsif params[:service_selection].present?
      service =   Service.find(params[:service_selection])
      @city = City.find(params[:city_id])
      @sub_services = service.sub_services
    elsif params[:service_id]
      @portfolios = PortfolioService.city_services(params[:service_id], params[:city_id]).map{|m| m.portfolio if m.portfolio.active?}.compact    
      @city = City.find(params[:city_id])
      @service_id  = params[:service_id]
    elsif params[:date].present?
      portfolio = Portfolio.find(params[:portfolio_id])
      @time_slots = portfolio.available_time_slots(params[:date])
    end
  end

  private
  
  
  def get_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  def service_request_params
    params.require(:service_request).permit(:address_id, :user_id,:status_id, :portfolio_id,:service_request_number,:time_slot_id,:service_date).merge(service_id: params[:service_id])
  end

  def service_request_update_params
    params.require(:service_request).permit(:address_id,:status_id, :portfolio_id,:time_slot_id, :service_id, :comment)
  end

end
