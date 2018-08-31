class HomeController < ApplicationController
  def index
  end

  def dashboard
  	@cities = City.ordered
  end

end
