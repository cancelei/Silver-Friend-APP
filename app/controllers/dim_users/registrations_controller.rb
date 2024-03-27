# app/controllers/dim_users/registrations_controller.rb
class DimUsers::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    super do |resource|
      if resource.persisted?
        # If the user is successfully created, check the role and redirect
        if resource.provider?
          redirect_to providers_dashboard_path and return
        elsif resource.consumer?
          redirect_to consumers_dashboard_path and return
        end
      end
    end
  end
end
