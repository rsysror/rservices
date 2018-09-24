class Employee::EmployeesController < EmployeesController

  def edit
    
  end

  def update
    if current_user.update_attributes(employee_params)
      flash[:success] = "Successfully Updated!"
    else
      flash[:error] = @user.errors.full_messages.join(",")
    end
      redirect_back fallback_location: request.referrer  
  end


 private


 def employee_params
  params.require(:user).permit(:first_name,:last_name,:phone, :phone)
 end

end
