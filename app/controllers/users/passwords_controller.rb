# # frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  prepend_before_action :require_no_authentication
  
  # Render the #edit only if coming from a reset password email link
  append_before_action :assert_reset_token_passed, only: :edit

  def new
     self.resource = resource_class.new
  end

  
  def create
     self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      flash[:success] = "A reset link has been sent to your registered email "
    else
      flash[:email] = "The email you entered is not registered with us"
    end
    redirect_to after_sending_reset_password_instructions_path_for
  end

  
  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
  end


  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?
    if resource.errors.empty?
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      redirect_to root_path
    else
      set_minimum_password_length
      flash[:error] = "Error"
      redirect_to '/'
    end
    
  end

   protected

    def after_update_path_for(resource)
      root_path
    end

  def after_resetting_password_path_for(resource)
    root_path
  end

  #  The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for
    root_path
  end

end
