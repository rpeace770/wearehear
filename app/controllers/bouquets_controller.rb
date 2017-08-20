class BouquetsController < ApplicationController

  def all
    @locations = Location.all
    render json: @locations.to_json
  end

  def new
  end

  def create
  end

  def confirm
  end

  def show
    @bouquet = Bouquet.find(params[:id])
  end

end
