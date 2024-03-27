module Providers
  class AvailabilitiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_provider

    def index
      @availabilities = @provider.availabilities
    end

    def new
      @availability = DimAvailability.new
    end

    def create
      @availability = @provider.availabilities.build(availability_params)
      if @availability.save
        respond_to do |format|
          format.html { redirect_to providers_dashboard_path, notice: 'Availability added successfully.' }
          format.turbo_stream
        end
      else
        render :new
      end
    end

    private

    def set_provider
      @provider = current_user.provider # Assumes provider relationship setup
    end

    def availability_params
      params.require(:dim_availability).permit(:service_id, :start_time, :end_time)
    end
  end
end
