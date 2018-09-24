class ApplicationController < ActionController::Base
  
  protect_from_forgery
  

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def authenticate_user!(*args)
    unless current_user
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def authorized_user?
    unless current_user && current_user.user?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

end
