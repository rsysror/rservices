class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit]

  # GET /resource/sign_up
  def new
    build_resource
    yield resource if block_given?
    respond_with resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
        sign_up(resource_name, resource)
        resource.add_role sign_up_params[:role].to_sym
        if(sign_up_params[:role] == "partner")
          resource.create_portfolio
        end
        set_flash_message! :notice, :signed_up
        redirect_to dashboard_path
    else
      clean_up_passwords resource
      set_minimum_password_length
      render :action => 'new'
    end
  end


  protected


    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,:password_confirmation,:role, :first_name, :last_name,:phone])
    end

  
    def sign_up_params
      params.require(:user).permit(:email, :password,:password_confirmation,:first_name,:role, :last_name,:phone)
    end

end
