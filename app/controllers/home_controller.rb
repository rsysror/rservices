class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index, :get_services_by_city]
	
  def index
    @services = Service.get_all_services(1,12)
  end

  def dashboard
  	 @cities = City.ordered
  end

  def get_services_by_city
  	if params[:city_id].present?
  		@services = City.find(params[:city_id]).services.where(parent_id: nil)
  	else
      @services = Service.get_all_services(1,12)
  	end
  end

end
