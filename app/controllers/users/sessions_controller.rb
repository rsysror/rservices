# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   self.resource = warden.authenticate!(auth_options)
  #   set_flash_message!(:notice, :signed_in)
  #   sign_in(resource_name, resource)
  #   yield resource if block_given?
  #   redirect_to after_login_path resource
  # end

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
          format.json { render json: "Password Mismatch!!", status: :unprocessable_entity }
        end
      else
        format.json { render json: "Email doesn't exist!!", status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  def after_login_path resource
    if (resource.has_role? :user)
      dashboard_url
    else 
      admin_root_url
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
