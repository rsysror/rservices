class HomeController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	
  def index
  	city = params[:post] ? params[:post][:city_id] : ''
  	# service = params[:post] ? params[:post][:service] : ''
  	if !params[:post].nil?
  		@services = City.find(city).services
  	else
  		@services = Service.all
  	end
  	# @services = Service.search(city,service)
  end

  def dashboard
  	@cities = City.details
  end

end
