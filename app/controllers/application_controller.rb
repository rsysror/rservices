class ApplicationController < ActionController::Base
  
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def after_login_path resource
    if (resource.has_role? :user)
      root_url
    elsif resource.has_role? :partner
      edit_partner_portfolio_url
      # partner_portfolio_url
    else
      admin_root_url
    end
  end
end
