class Partner::UsersController < PartnerController

  before_action :find_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully Updated!"
    else
      flash[:error] = @user.errors.full_messages.join(",")
    end
      redirect_back fallback_location: request.referrer  
  end




  private

  def user_params
    params.require(:user).permit(:first_name,:last_name,:phone, :phone)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
