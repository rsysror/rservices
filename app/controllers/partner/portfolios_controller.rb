class Partner::PortfoliosController < PartnerController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = Portfolio.find(current_user.portfolio.id)
    @cities = City.details.order(:name)
    @services = Service.get_services
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to partner_portfolio_path(@portfolio), notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_subservices
    @subservices = Service.where(:parent_id => params[:parent_id])
    render :partial => "subservices", :object => @subservices
  end

  def get_city_service_list
    if params[:portfolio][:city_id].present?
      @city = City.find(params[:portfolio][:city_id])
      @services = @city.services
    # else
    #   @services = Service.where(:parent_id => nil)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = current_user.portfolio
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:gender, :about, :experience, :education, :avatar, :city_id, :service_id, {documents: []}, {images: []})
    end
end
