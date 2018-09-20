class Partner::CompanyServicesController < PartnerController
  before_action :find_portfolio_service, only: [:edit, :update, :destroy]
  
  def index
    @portfolio_services = current_user.portfolio.portfolio_services.group_by(&:city_id)
  end

  def new
    @sub_services = Service.get_sub_services
    @portfolio_services = PortfolioService.new
  end

  def get_cities
    if params[:portfolio_service][:service_id].present?
      @cities = Service.find(params[:portfolio_service][:service_id]).service.cities.uniq
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
    byebug
  end

  private

  def portfolio_service_params city_id, portfolio_id
    params.require(:portfolio_service).permit(:service_id, :price).merge(city_id: city_id, portfolio_id: portfolio_id)
  end

  def find_portfolio_service
    @portfolio_service = PortfolioService.find(params[:id])
  end
end
