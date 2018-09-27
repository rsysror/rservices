class Partner::DashboardController < PartnerController
  before_action :get_service_requests, only: [:index, :accept_reject]
  before_action :get_employees, only: [:manage_employees]
  

  def index
  end

  def accept_reject
    service_request = ServiceRequest.find(params[:id])
    if service_request
      if Status::ACTION.include?(params[:value])
        service_request.update_attributes(:status_id => Status.send(params[:value]).first.id)
        UserMailer.accepted_rejected(current_user, service_request).deliver_now
      end
    end
  end

  def manage_employees
    
  end

  def manage_service_requests
    @service_requests = current_user.portfolio.service_requests.includes(:status).accepted_request.order("id DESC")
    @employees =  current_user.employees.where(status: true)-current_user.portfolio.service_requests.available_employees
   
  end  

  def assign_service_request_to_user
    if params[:service_request][:request_id].present?
      ServiceRequest.find(params[:service_request][:request_id]).update(status: Status.inprogress.last, assignee_id: params[:service_request][:assignee_id] )
      @service_requests = current_user.portfolio.service_requests.includes(:status).accepted_request.order("id DESC")
      # flash[:success] = "User Assign Successfully"
    else
      @errors = "Assign request failed !" 
    end  
  end 

  def manage_employee_status
    #byebug
    if params[:id].present?
      employee = User.find(params[:id])
      employee.status ? employee.update(status: false) : employee.update(status: true)
     else
      @errors = "Status changed fail" 
    end
    @employees =  current_user.employees.order("id DESC")  
  end  

  private
  
  def get_service_requests
    @service_requests = current_user.portfolio.service_requests.includes(:status).order("id DESC")
  end

  def get_employees
    @employees =  current_user.employees.order("id DESC")
  end  

end
