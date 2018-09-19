class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  skip_before_action :authenticate_user!, only: [:create], raise: false

  # GET /resource/sign_in
  def new
    super
  end

  def create
    user = User.find_for_authentication(:email => params[:user][:email])
    if user.present?
      if user.valid_password?(params[:user][:password])
        get_login_details
      else
        @error = "Password Mismatch!!"
      end
    else
      @error =  "Email doesn't exist!!"
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def after_login_path resource
    if resource.admin?
      admin_root_url
    elsif resource.partner?
      partner_portfolio_url
    elsif resource.employee?
      employee_root_url  
    else
      dashboard_url
    end
  end

  def get_login_details
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    @success_url = after_login_path resource
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
