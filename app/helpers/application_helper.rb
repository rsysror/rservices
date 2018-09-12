module ApplicationHelper
    
  #fix this code with switch case
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

end


