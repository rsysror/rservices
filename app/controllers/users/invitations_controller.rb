class Users::InvitationsController < Devise::InvitationsController

  skip_before_action :has_invitations_left?, :only => [:create]
  skip_before_action :resource_from_invitation_token, :only => [:edit, :destroy]

  before_action :scoped_has_invitations_left?, :only => [:create]
  before_action :scoped_resource_from_invitation_token, :only => [:edit, :destroy]

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
        redirect_to dashboard_path
      else
        set_flash_message :notice, :updated_not_active if is_flashing_format?
        redirect_to root_path
      end
    else
      resource.invitation_token = raw_invitation_token
      render :edit
    end
  end

 

  protected

  def invite_resource(&block)
    User.invite!(invite_params, current_inviter, &block)
  end

  def accept_resource
    User.accept_invitation!(update_resource_params)
  end

  def current_inviter
    authenticate_inviter!
  end

  def scoped_has_invitations_left?
    unless current_inviter.nil? || current_inviter.has_invitations_left?
      self.resource = User.new
      set_flash_message :alert, :no_invitations_remaining if is_flashing_format?
      respond_with_navigational(resource) { render :new }
    end
  end

  def scoped_resource_from_invitation_token
    unless params[:invitation_token] && self.resource = User.find_by_invitation_token(params[:invitation_token], true)
      set_flash_message(:alert, :invitation_token_invalid) if is_flashing_format?
      redirect_to after_sign_out_path_for(resource_name)
    end
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