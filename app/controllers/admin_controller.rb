class AdminController < ApplicationController
  before_action :authorized?
 
  layout "admin"
  private

  def authorized?
    unless current_user && current_user.admin?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

end
