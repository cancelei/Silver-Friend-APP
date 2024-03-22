class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :user_signed_in?, :current_user, :authenticate_user!

  def user_signed_in?
    dim_user_signed_in?
  end

  def current_user
    current_dim_user
  end

  def authenticate_user!
    authenticate_dim_user!
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:account_type])
  end
end
