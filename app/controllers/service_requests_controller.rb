class ServiceRequestsController < ApplicationController
   before_action :get_service_request, only: [:edit,:show, :update,:cancel_service_request]

  def index
    @service_requests = current_user.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).order("id DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def create
    service_request =  current_user.service_requests.create(service_request_params)
    if service_request
      UserMailer.service_request_generate(current_user,service_request, 'user').deliver_now
      UserMailer.service_request_generate(current_user,service_request, 'partner').deliver_now
      redirect_to '/service_requests'
    end
  end

  def edit
    @cities = City.details
    @addresses = current_user.get_all_address_from_service_city(@service_request)
  end

  def show; end

  def update
    service_request = @service_request.update_attributes(service_request_update_params)
    if service_request
      redirect_to '/service_requests'
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
      @services = @city.services
    elsif params[:service_selection].present?
      service =   Service.find(params[:service_selection])
      @portfolio = Portfolio.where(service_id: service.id, city_id: params[:city_id])
      @time_slots = @portfolio.last.available_time_slots if @portfolio.present?
      @sub_services = service.sub_services
    end
  end

  private
  
  
  def get_service_request
    @service_request = ServiceRequest.find(params[:id])
  end

  def service_request_params
    params.require(:service_request).permit(:address_id, :user_id,:status_id, :portfolio_id,:service_request_number,:time_slot_id).merge(service_id: params[:sub_service_selection])
  end

  def service_request_update_params
    params.require(:service_request).permit(:address_id,:status_id, :portfolio_id,:time_slot_id, :service_id)
  end

end
