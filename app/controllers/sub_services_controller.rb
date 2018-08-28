class SubServicesController < AdminController
  before_action :set_sub_service, only: [:show, :edit, :update, :destroy]

  # GET /sub_services
  # GET /sub_services.json
  def index
    @sub_services = SubService.all
  end

  # GET /sub_services/1
  # GET /sub_services/1.json
  def show
  end

  # GET /sub_services/new
  def new
    @sub_service = SubService.new
  end

  # GET /sub_services/1/edit
  def edit
  end

  # POST /sub_services
  # POST /sub_services.json
  def create
    @sub_service = SubService.new(sub_service_params)

    respond_to do |format|
      if @sub_service.save
        format.html { redirect_to @sub_service, notice: 'Sub service was successfully created.' }
        format.json { render :show, status: :created, location: @sub_service }
      else
        format.html { render :new }
        format.json { render json: @sub_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_services/1
  # PATCH/PUT /sub_services/1.json
  def update
    respond_to do |format|
      if @sub_service.update(sub_service_params)
        format.html { redirect_to @sub_service, notice: 'Sub service was successfully updated.' }
        format.json { render :show, status: :ok, location: @sub_service }
      else
        format.html { render :edit }
        format.json { render json: @sub_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_services/1
  # DELETE /sub_services/1.json
  def destroy
    @sub_service.destroy
    respond_to do |format|
      format.html { redirect_to sub_services_url, notice: 'Sub service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_service
      @sub_service = SubService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_service_params
      params.require(:sub_service).permit(:name, :service_id)
    end
end
