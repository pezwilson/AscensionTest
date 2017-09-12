class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def verify_admin
    access_denied if !current_user.admin_area?
  end

  def access_denied
    redirect_to welcome_index_url, alert: "You do not have access to that part of AscensionTest"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name ])

    update_attrs = [:first_name, :last_name, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end
end
