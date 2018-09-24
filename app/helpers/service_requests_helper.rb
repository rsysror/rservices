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
    elsif ["Pending", "InCompleted"].include?(request.status.try(:name)) 
      (link_to t('.show', :default => t("helpers.links.show")),service_request_path(request),:class => 'btn btn-xs btn-primary btn_margin') +
       (link_to t('.edit', :default => t("helpers.links.edit")), edit_service_request_path(request), :class => 'btn btn-primary btn-xs btn_margin') +
      (link_to t('.cancel', :default => t("helpers.links.cancel")),cancel_service_request_service_request_path(request),:method => :patch,:data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },:class => 'btn btn-xs btn-danger')
    else
      (link_to t('.show', :default => t("helpers.links.show")),service_request_path(request),:class => 'btn btn-xs btn-primary btn_margin')
    end
  end

  def user_ratings request
    if request.status.try(:name) == "Completed"
      if current_user.user?
        request.feedback.present? ? add_rating_html_block(request) : (link_to 'Give Rating',new_feedback_path(portfolio_id: request.portfolio_id, request_id: request.id),:method => :get,:class => 'btn btn-success btn-xs')
      else
        request.feedback.present? ? add_rating_html_block(request) : '-'
      end
    else
      "Not Yet Rated"
    end
  end

  def service_request_header_html_block
    columns = ['Service Name', 'Address','User','Service Date','Time','Service Request Number','Status','Rating','Actions']
    thead = content_tag :thead do
      content_tag :tr do
        columns.collect {|column|  concat content_tag(:th,column)}.join().html_safe
      end
    end
  end

  def address_action_links address
    (link_to edit_address_path(address),class: 'btn btn-default btn-xs' do
       content_tag(:span, '',class: 'glyphicon glyphicon-edit')
    end) +   

     (link_to address_path(address),method: "delete",class: 'btn btn-default btn-xs',:data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) } do
      content_tag(:span, '',class: 'glyphicon glyphicon-remove')
    end)
  end

  def assigned_user(user_id=nil)
    user_id.present? ? User.find(user_id).try(:email) : "-"
  end
  
end
