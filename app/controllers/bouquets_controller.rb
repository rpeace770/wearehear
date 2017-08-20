
class BouquetsController < ApplicationController

  def new

  end

  def create
    # Use form data to create new bouquet.
  end

  def confirm
    @bouquet = Bouquet.find(params[:id])
  end

  def show
    @bouquet = Bouquet.find(params[:id])
  end

end
