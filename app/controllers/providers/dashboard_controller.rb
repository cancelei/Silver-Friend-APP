module Providers
  class DashboardController < ApplicationController
    before_action :authenticate_user!

    def show
      @provider = current_user.provider
      @availability = DimAvailability.new
    end
  end
end
