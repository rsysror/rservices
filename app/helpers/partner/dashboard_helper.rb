module Partner::DashboardHelper

  def partner_action request
    if ["Pending"].include?(request.status.try(:name))
      (link_to 'Accept', accept_reject_partner_dashboard_index_path(value: "accepted", id: request.id), method: :put, :remote => true, class: " btn btn-success btn-xs btn_margin", data: { confirm: 'Are you sure?' }) +
      (link_to 'Reject', accept_reject_partner_dashboard_index_path(value: "rejected", id:request.id ), method: :put, :remote => true, class: " btn btn-danger btn-xs", data: { confirm: 'Are you sure?' } ) +
      (link_to 'Comment', open_comment_pop_up_path(id: request.id), method: :get, :remote => true, id: '#comment', class: " btn btn-primary btn-xs btn_margin")
    elsif request.status.try(:name) == "Accepted"
      (link_to 'Complete', accept_reject_partner_dashboard_index_path(value: "completed", id: request.id), method: :put, :remote => true, class: " btn btn-success btn-xs btn_margin", data: { confirm: 'Are you sure?' } ) +
      (link_to 'In Complete', accept_reject_partner_dashboard_index_path(value: "incompleted", id: request.id), method: :put, :remote => true, class: " btn btn-danger btn-xs", data: { confirm: 'Are you sure?' } )
    elsif (request.status.try(:name) == "Completed")
      request.feedback.present? ? add_rating_html_block(request) : "Not Yet Rated" 
    elsif (request.status.try(:name) == "InCompleted") || (request.status.try(:name) == "Onhold")
      (link_to 'Comment', open_comment_pop_up_path(id: request.id), method: :get, :remote => true, id: '#comment', class: " btn btn-primary btn-xs btn_margin")
    else
      "-"
    end
  end

  def employee_actions employee
    link_to edit_partner_user_path(employee),class: 'btn btn-default btn-xs' do 
      content_tag(:span, '',class: 'glyphicon glyphicon-edit')
    end 
  end                
end
