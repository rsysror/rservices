class Admin::ServicesController < AdminController
  load_and_authorize_resource
  before_action :set_service, only: [:show, :edit, :update, :destroy, :edit_sub_services]

  layout 'admin'
  # GET /services
  # GET /services.json
  def index
    @services = Service.where(:parent_id => nil).order(:id)
  end

  # GET /services/1
  # GET /services/1.json
  def show
    
  end

  # GET /services/new
  def new
    @service = Service.new
    @cities = City.details.order(name: :asc)
  end

  # GET /services/1/edit
  def edit
    @cities = City.details.order(name: :asc)
  end

  # POST /services
  # POST /services.json
  def create
    @cities = City.details.order(name: :asc)
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_services_path(@service), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_services_path(@service), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sub_services
    @services = Service.where(:parent_id => params[:id]  )
  end

  # GET /services/1/create_sub_services
  def create_sub_services
    @sub_service = Service.new
  end

  # GET /services/1/edit_sub_services
  def edit_sub_services

  end  

  # PATCH/PUT /services/1/edit_sub_services
  # PATCH/PUT /services/1.json
  def update_sub_services
    respond_to do |format|
      if @service.update(sub_service_params)
        format.html { redirect_to sub_services_admin_service_path(:id => @service.parent_id), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name,:parent_id, :photo, :price, :city_ids=> [])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_service_params
      params.require(:service).permit(:name,:id, :price, :city_ids=> [])
    end
end
