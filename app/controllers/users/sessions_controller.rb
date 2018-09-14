class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  skip_before_action :authenticate_user!, only: [:create], raise: false

  # GET /resource/sign_in
  def new
    super
  end

  def create
    user = User.find_for_authentication(:email => params[:user][:email])
    respond_to do |format|
      if user.present?
        if user.valid_password?(params[:user][:password])
          self.resource = warden.authenticate!(auth_options)
          set_flash_message!(:notice, :signed_in)
          sign_in(resource_name, resource)
          url = after_login_path resource
          format.json { render json: {url: url}, status: :ok }
        else
          format.json { render json: "Password Mismatch!!", status: :unauthorized }
        end
      else
        format.json { render json: "Email doesn't exist!!", status: :unauthorized }
      end
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
    else
      dashboard_url
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
