module Partner::DashboardHelper

	def partner_action request
		if ["Pending", "Inprogress"].include?(request.status.try(:name))
    	(link_to 'Accept', accept_reject_partner_dashboard_index_path(value: "accepted", id: request.id), method: :put, :remote => true, class: " btn btn-success") +
    	(link_to 'Reject', accept_reject_partner_dashboard_index_path(value: "rejected", id:request.id ), method: :put, :remote => true, class: " btn btn-danger" )
   	elsif request.status.try(:name) == "Accepted"
    	(link_to 'Complete', accept_reject_partner_dashboard_index_path(value: "completed", id: request.id), method: :put, :remote => true, class: " btn btn-success") +
    	(link_to 'In Complete', accept_reject_partner_dashboard_index_path(value: "incompleted", id: request.id), method: :put, :remote => true, class: " btn btn-success") 
   	elsif (request.status.try(:name) == "Completed")
   	 	request.feedback.present? ? add_rating_html_block(request) : "No rating Received Yet"
  	end
	end

	

end
