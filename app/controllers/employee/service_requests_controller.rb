class Employee::ServiceRequestsController < EmployeesController
  before_action :get_service_requests, only: [:index, :accept_reject]

  def index
    # @service_requests = current_user.service_requests.includes(:service,:address,:status, :portfolio, :time_slot).ordered.paginate(:page => params[:page], :per_page => 5)
  end

  def accept_reject
    service_request = ServiceRequest.find(params[:id])
    if service_request
      if Status::ACTION.include?(params[:value])
        service_request.update_attributes(:status_id => Status.send(params[:value]).first.id)
      end
      UserMailer.accepted_rejected(current_user, service_request).deliver_now
    end
  end


  private
  
  def get_service_requests
    @service_requests = current_user.assigned_service_requests.ordered.paginate(:page => params[:page], :per_page => 5).order("id DESC")
  end

end
