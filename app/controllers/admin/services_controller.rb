class Admin::ServicesController < AdminController
  load_and_authorize_resource
  before_action :set_service, only: [:show, :edit, :update, :destroy, :edit_sub_services]

  layout 'admin'
 
  def index
    @services = Service.where(:parent_id => nil).order(:id)
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
    @service = Service.new(service_params)
    if @service.save
      redirect_to admin_services_path(@service), notice: 'Service was successfully created.' 
    else
      render :new 
    end
  end

  def update
    if @service.update(service_params)
      redirect_to admin_services_path(@service), notice: 'Service was successfully updated.'
    else
      render :edit 
    end
  end

  def destroy
    @service.destroy
    redirect_to admin_services_url, notice: 'Service was successfully destroyed.' 
  end

  def sub_services
    @services = Service.where(:parent_id => params[:id]  )
  end

  def create_sub_services
    @sub_service = Service.new
  end

  def edit_sub_services
  end  

  def update_sub_services
    if @service.update(sub_service_params)
      redirect_to sub_services_admin_service_path(:id => @service.parent_id), notice: 'Service was successfully updated.'
    else
      render :edit 
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
