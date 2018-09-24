module Admin::UsersHelper

  def users_city user
    user.addresses.map{|m| m.city.try(:name)}.join(', ')
  end

  def company_address user
    user.portfolio.address
  end

  def company_name user
    user.portfolio.company_name
  end

  def admin_status_action request
    if (request.status.try(:name) == "Pending")
      (link_to "Accept",update_service_status_admin_user_path(request_id: request.id,status: "Accepted"),:data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },:class => 'btn btn-success btn-xs btn_margin', style: "color:#fff" ) + 
      (link_to "Reject",update_service_status_admin_user_path(request_id: request.id ,status: "Rejected"),:data => { :confirm => t('.confirm', :default => t("helpers.links.confirm", :default => 'Are you sure?')) },:class => 'btn btn-danger btn-xs', style: "color:#fff") 
    elsif (request.status.try(:name) == "Completed")
      request.feedback.present? ? (render partial: "shared/show_rating" , locals: {request: request, score: request.feedback.rating }) : "Not Yet Rated"
    end 
  end 


end
