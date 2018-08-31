class HomeController < ApplicationController
  def index
  end

  def dashboard
  	@cities = City.details
  end

end
