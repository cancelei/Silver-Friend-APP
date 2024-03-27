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

  def after_sign_in_path_for(resource)
    # Check if the user is a provider and redirect them accordingly
    if resource.provider? # Assuming you have a method or check to identify a provider
      providers_dashboard_path # Path to the provider's dashboard
    else
      super # Use the default redirection for other types of users
    end
  end
end
