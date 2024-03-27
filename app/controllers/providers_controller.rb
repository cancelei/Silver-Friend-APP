class ProvidersController < ApplicationController
  before_action :authenticate_user!

  def new
    @provider = current_user.build_provider # Assumes has_one association
  end

  def create
    @provider = current_user.build_provider(provider_params)
    if @provider.save
      redirect_to providers_dashboard_path, notice: 'Provider profile created successfully.'
    else
      render :new
    end
  end

  private

  def provider_params
    params.require(:dim_provider).permit(:description, :documentation_approved, :specific_service_qualified)
  end
end
