module ServiceRequestsHelper

  def city_selection_from_address service_request
     service_request.address.city.id
  end

  def get_sub_services_list service_id
     Service.where(parent_id: get_parent_id(service_id))
  end

  def get_services_list service_request
    city = service_request.address.city
    city.services.where(id: get_parent_id(service_request.service_id) )
  end

  def get_available_time_slots service_request
    service_request.portfolio.available_time_slots_for_update(service_request)
  end

  def get_parent_id service_id
    Service.find(service_id).parent_id
  end

  def user_actions request
    if ["Completed", "Cancelled", "Rejected"].include?(request.status.try(:name))
      (link_to t('.show', :default => t("helpers.links.show")),service_request_path(request),:class => 'btn btn-xs btn-primary')
    else
      (link_to t('.show', :default => t("helpers.links.show")),service_request_path(request),:class => 'btn btn-xs btn-primary btn_margin') +
      (link_to t('.edit', :default => t("helpers.links.edit")), edit_service_request_path(request), :class => 'btn btn-primary btn-xs btn_margin') +
      (link_to t('.cancel', :default => t("helpers.links.cancel")),cancel_service_request_service_request_path(request),:method => :patch,:data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },:class => 'btn btn-xs btn-danger')
    end
  end

  def user_ratings request
    if request.status.try(:name) == "Completed"
      request.feedback.present? ? add_rating_html_block(request) : (link_to 'Give Rating',new_feedback_path(portfolio_id: request.portfolio_id, request_id: request.id),:method => :get,:class => 'btn btn-success btn-xs')
    else
      "Not Yet Rated"
    end
  end

  def service_request_header_html_block
    columns = ['Service Name', 'Address','Vendor','Time Slot','Service Request Number','Status','Rating','Actions']
    thead = content_tag :thead do
      content_tag :tr do
        columns.collect {|column|  concat content_tag(:th,column)}.join().html_safe
      end
    end
  end
  
end
