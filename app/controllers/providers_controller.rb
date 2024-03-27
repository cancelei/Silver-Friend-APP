class ProvidersController < ApplicationController
  before_action :authenticate_user!

  private

  def provider_params
    params.require(:dim_provider).permit(:description, :documentation_approved, :specific_service_qualified)
  end
end
