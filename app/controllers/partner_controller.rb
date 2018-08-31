class PartnerController < ActionController::Base

 before_action :authorized?, except: :index
 layout "admin"

  

  private
  def authorized?
    unless current_user && current_user.partner?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

end
