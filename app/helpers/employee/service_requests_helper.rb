module Employee::ServiceRequestsHelper
 
  def employ_action request
    if request.status.try(:name) == "Accepted"
      (link_to 'Complete', accept_reject_employee_service_requests_path(value: "completed", id: request.id), method: :put, :remote => true, class: " btn btn-success btn-xs btn_margin") +
      (link_to 'On hold', accept_reject_employee_service_requests_path(value: "on-hold", id: request.id), method: :put, :remote => true, class: " btn btn-danger btn-xs") +
      (link_to 'Comment', open_comment_pop_up_path(id: request.id), method: :get, :remote => true, id: '#comment', class: " btn btn-info btn-xs btn_margin")
    elsif (request.status.try(:name) == "Completed")
      request.feedback.present? ? add_rating_html_block(request) : "Not Yet Rated" 
      (link_to 'Comment', open_comment_pop_up_path(id: request.id), method: :get, :remote => true, id: '#comment', class: " btn btn-info btn-xs btn_margin")
    else
      "-"
    end
  end
  
end