module Providers
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def show
      # Redirect or handle the case where the provider does not exist
      unless current_user.provider
        # Redirect the user to create a provider profile or show an error
        redirect_to new_provider_path, alert: "You must set up a provider profile first."
        return
      end

      @provider = current_user.provider
      @availability = DimAvailability.new
    end

    private

    # def ensure_provider
    #   redirect_to new_provider_path, alert: 'Please set up your provider profile.' if current_user.provider.nil?
    # end
  end
end
