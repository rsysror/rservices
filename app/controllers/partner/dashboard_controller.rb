class Partner::DashboardController < ApplicationController
  before_action :get_service_requests, only: [:index, :accept_reject]

  def index
    
  end

  def accept_reject
    service_request = ServiceRequest.find(params[:id])
    if service_request
      if params[:value] == 'accept'
        service_request.update_attributes(:status_id => Status.accepted.first.id)      
      else
        service_request.update_attributes(:status_id => Status.rejected.first.id)      
      end
    end
  end

  private
  
  def get_service_requests
    @service_requests = current_user.portfolio.service_requests
  end


end
