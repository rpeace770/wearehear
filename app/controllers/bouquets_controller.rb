class BouquetsController < ApplicationController

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
