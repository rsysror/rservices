class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	
  def index
    # @services = Service.get_services.limit(10)
    @services = Service.all.order(created_at: :desc).limit(12)
  end

  def dashboard
  	@cities = City.details
  end

  def get_services_by_city
  	if !params[:city_id].nil?
  		@services = City.find(params[:city_id]).services
  	else
  		@services = Service.all.order(created_at: :desc).limit(12)
  	end
  	
  end

end
