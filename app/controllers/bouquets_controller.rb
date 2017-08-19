
class BouquetsController < ApplicationController

  def new

  end

  def create

  end

  def confirm
    @bouquet = Bouquet.find(params[:id])
  end

  def show

  end

end
