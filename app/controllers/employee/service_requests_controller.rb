class Employee::ServiceRequestsController < EmployeesController

  def index
    # @service_requests = current_user.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => params[:page], :per_page => 5)
    @service_requests = current_user.assigned_service_requests.ordered.paginate(:page => params[:page], :per_page => 5)
  end  

end
