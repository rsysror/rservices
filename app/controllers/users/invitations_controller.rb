class Users::InvitationsController < Devise::InvitationsController

  prepend_before_action :authenticate_inviter!, :only => [:new, :create]
  prepend_before_action :has_invitations_left?, :only => [:create]
  prepend_before_action :require_no_authentication, :only => [:edit, :update, :destroy]
  prepend_before_action :resource_from_invitation_token, :only => [:edit, :destroy]

  if respond_to? :helper_method
    helper_method :after_sign_in_path_for
  end

  
  def new
    self.resource = User.new
    render :new, :layout => 'admin'
  end

  
  def create
    self.resource = invite_resource
    resource_invited = resource.errors.empty?

    yield resource if block_given?

    if resource_invited
      if is_flashing_format? && self.resource.invitation_sent_at
        flash[:success] = "An Email has beed sent to #{self.resource.email}"
      end
      redirect_to partner_dashboard_index_path
    else
      redirect_back fallback_location: request.referrer
    end
  end

  
  def edit
    set_minimum_password_length
    resource.invitation_token = params[:invitation_token]
    render :edit
  end

  
  def update
    raw_invitation_token = update_resource_params[:invitation_token]
    self.resource = accept_resource
    invitation_accepted = resource.errors.empty?

    yield resource if block_given?

    if invitation_accepted
      if Devise.allow_insecure_sign_in_after_accept
        resource.add_role :employee
        sign_in(resource_name, resource)
        redirect_to employee_root_path
      else
        set_flash_message :notice, :updated_not_active if is_flashing_format?
        redirect_to employee_root_path
      end
    else
      resource.invitation_token = raw_invitation_token
      render :edit
    end
  end

 

  protected

  def invite_resource(&block)
    User.invite!(invite_params, current_user, &block)
  end

  def accept_resource
    User.accept_invitation!(update_resource_params)
  end

  def invite_params
    devise_parameter_sanitizer.sanitize(:invite)
  end

  def update_resource_params
    devise_parameter_sanitizer.sanitize(:accept_invitation)
  end

  def translation_scope
    'devise.invitations'
  end
end