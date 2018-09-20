class EmployeesController < ApplicationController
  before_action :authorized?
 
  layout "admin"
  private

  def authorized?
    unless current_user && current_user.employee?
      flash[:error] = "You are not authorized to view that page."
      redirect_to employee_root_path
    end
  end

 
end
