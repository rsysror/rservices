
module ApplicationHelper
  include FormElement
    
  def current_user_role user
    (user.has_role? :admin) ? "Admin" : ((user.has_role? :user) ? "User" : "Partner")
  end

  def service_select
    Service.all.collect {|u| [u.name, u.id]}
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
  end

  def add_rating_html_block request
    render partial: "shared/show_rating" , locals: {request: request, score: request.feedback.rating } 
  end

  def dashboard_link user
    if current_user.admin?
      link_to "Admin dashboard", admin_services_path
    elsif current_user.partner?
      (link_to "Company dashboard", partner_dashboard_index_path)
    elsif current_user.user?
      link_to "Dashboard", dashboard_path
    end
  end

  def back_button_link url
    link_to t('.Back', :default => t("helpers.links.back")),url,:class => 'btn btn-primary'
  end


end
