module Employee::ServiceRequestsHelper
 
  def employee_action request
    if request.status == Status.inprogress.last
      (link_to 'Complete', accept_reject_employee_service_requests_path(value: "completed", id: request.id), method: :put, :remote => true, class: " btn btn-success btn-xs btn_margin", data: { confirm: 'Are you sure?' } ) +
      (link_to 'On hold', accept_reject_employee_service_requests_path(value: "onhold", id: request.id), method: :put, :remote => true, class: " btn btn-danger btn-xs", data: { confirm: 'Are you sure?' }) +
      (link_to 'Comment', open_comment_pop_up_path(id: request.id), method: :get, :remote => true, id: '#comment', class: " btn btn-info btn-xs btn_margin")
    elsif (request.status == Status.completed.last )
      request.feedback.present? ? add_rating_html_block(request) : "Not Yet Rated" 
    # elsif (request.status == Status.onhold.last )
    #   (link_to 'Comment', open_comment_pop_up_path(id: request.id), method: :get, :remote => true, id: '#comment', class: " btn btn-info btn-xs btn_margin")
    else
      "-"
    end
  end
  
end