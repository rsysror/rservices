class PartnerController < ActionController::Base

 before_action :authorized?, except: :index
 before_action :active_partner?
 layout "admin"

  

  private
  def authorized?
    unless current_user && current_user.partner?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

  def active_partner?
    unless current_user && current_user.partner? && current_user.portfolio.status
      flash[:error] = "Please update your profile or contact admin for activation!."
    end
  end

end
