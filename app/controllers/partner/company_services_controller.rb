class Partner::CompanyServicesController < PartnerController
  before_action :find_portfolio_service, only: [:edit, :update, :destroy]
  
  def index
    @portfolio_services = current_user.portfolio.portfolio_services.order(:city_id).group_by(&:city_id)
  end

  def new
    @sub_services = Service.get_sub_services
    @portfolio_service = PortfolioService.new
  end

  def get_cities
    sub_service_id = params[:portfolio_service][:service_id]
    if sub_service_id.present?
      @cities = Service.find(params[:portfolio_service][:service_id]).service.service_city - current_user.portfolio.remove_existing_service_city(sub_service_id)
    end
  end

  # need to refactor
  def create
    city_ids = params[:portfolio_service][:city_ids]
    if city_ids.present?
      city_ids.each do |city_id|
        service = PortfolioService.create(portfolio_service_params(city_id, current_user.portfolio.id))
      end
      flash[:success] = "Service created successfully!"
      redirect_to partner_company_services_path
    else
      flash.now[:error] = "Please select a city and then proceed!"
      render :new 
    end
  end

  def edit
  end

  def update
    @portfolio_service.update_attributes(portfolio_service_update_params)
    if @portfolio_service
      flash[:success] = "Price Updated Successfully!"
      redirect_to partner_company_services_path
    else
      flash[:error] =  "Error"
      render :edit
    end
  end

  def destroy
    @portfolio_service.destroy
    flash[:success] = "Service deleted successfully!"
    redirect_to partner_company_services_path
  end

  private

  def portfolio_service_params city_id, portfolio_id
    params.require(:portfolio_service).permit(:service_id, :price).merge(city_id: city_id, portfolio_id: portfolio_id)
  end

  def portfolio_service_update_params
    params.require(:portfolio_service).permit(:price)
  end

  def find_portfolio_service
    @portfolio_service = PortfolioService.find(params[:id])
  end
end
