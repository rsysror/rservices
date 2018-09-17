class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!, only: [:new, :create], raise: false
  prepend_before_action :require_no_authentication, only: [:new, :create, :cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]
  prepend_before_action :set_minimum_password_length, only: [:new, :edit]

  # GET /resource/sign_up
  def new
    build_resource
    yield resource if block_given?
    respond_with resource
  end

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
      @url = after_registration_path(resource)
    else
      @errors = resource.errors.full_messages.join(", ")
    end
  end

  protected

    def after_registration_path resource
      if (resource.has_role? :user)
        root_url
      elsif resource.has_role? :partner
        edit_partner_portfolio_url
      else
        admin_root_url
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password,:password_confirmation,:role, :first_name, :last_name,:phone])
    end

    def sign_up_params
      params.require(:user).permit(:email, :password,:password_confirmation,:first_name,:role, :last_name,:phone)
    end

end
