class HomeController < ApplicationController
  before_action :authenticate_dimUser!, except: [:index, :show]
  def index
  end

  def show
    # Action implementation here
  end

end
