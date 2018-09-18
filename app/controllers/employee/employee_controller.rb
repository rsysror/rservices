class Employee::EmployeeController < ApplicationController
  before_action :authenticate_user!

  def index
    #byebug
    @service_requests = current_user.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => params[:page], :per_page => 5)
  end
    
end
