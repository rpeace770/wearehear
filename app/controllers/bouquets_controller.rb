class BouquetsController < ApplicationController

  def all
    @bouquets = Bouquet.all
    render json: @bouquets.to_json
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
