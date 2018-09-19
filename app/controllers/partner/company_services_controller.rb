class Partner::CompanyServicesController < PartnerController
  
  def index
    @services = current_user.portfolio.services.uniq
  end

  def new
    @services = Service.get_services
    @portfolio_services = PortfolioService.new
  end

  def get_cities
    if params[:portfolio_service][:service_id].present?
      @cities = Service.find(params[:portfolio_service][:service_id]).cities
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

  private

  def portfolio_service_params city_id, portfolio_id
    params.require(:portfolio_service).permit(:service_id).merge(city_id: city_id, portfolio_id: portfolio_id)
  end
end
