class PartnerController < ApplicationController
  before_action :authorized?, except: :index
 
  private
  def authorized?
    unless current_user && current_user.partner?
      flash[:error] = "You are not authorized to view that page."
      redirect_to root_path
    end
  end

end
