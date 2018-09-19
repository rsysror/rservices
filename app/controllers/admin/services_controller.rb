class Admin::ServicesController < AdminController
  load_and_authorize_resource
  before_action :set_service, only: [:show, :edit, :update, :destroy, :edit_sub_services]

  layout 'admin'
 
  def index
    @services = Service.get_all_services(params[:page])
  end

  def show

  end

  def new
    @service = Service.new
    @cities = City.details.order(name: :asc)
  end

  def edit
    @cities = City.details.order(name: :asc)
  end

  def create
    @cities = City.details.order(name: :asc)
    @service = Service.create(service_params)
    if @service
      flash[:success] = "Service created successfully "
      redirect_to admin_services_path
    else
      flash[:error] = "Service request not created!"
      redirect_to new_admin_service_path
    end   

  end

  def update
    if @service.update(service_params)
      flash[:success] = "Service updated successfully "
      redirect_to admin_services_path
    else
      flash[:error] = "Service not updated!"
      redirect_to new_admin_service_path    
    end
  end

  def destroy
    @service.destroy
    flash[:success] = "Service was successfully destroy !"
    redirect_to admin_services_url
  end

  def sub_services
    @services = Service.get_all_sub_services(params[:id], params[:page])
  end

  def create_sub_services
    @sub_service = Service.new
  end

  def edit_sub_services
  end  

  def update_sub_services
    if @service.update(sub_service_params)
      flash[:success] = "Service is successfully updated"
      redirect_to sub_services_admin_service_path(@service.service)
    else
      flash[:error] = "Service is successfully updated"
      redirect_to sub_services_admin_service_path(@service.service)
    end
    
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:name,:parent_id, :price, :photo, :city_ids=> [])
    end

    def sub_service_params
      params.require(:service).permit(:name,:id, :price, :city_ids=> [])
    end
end
