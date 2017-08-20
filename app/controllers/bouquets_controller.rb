
class BouquetsController < ApplicationController

  def all
    @locations = Location.all
    render json: @locations.to_json
  end

  def locations
    locations = []
    user = User.find(current_user.id)
    bouquets = user.sent_bouquets
    bouquets.each do |bouquet|
      locations << Location.find(bouquet.location_id)
    end
    render json: locations.to_json
  end

  def new

  end

  def create

  end

  def confirm
    @bouquet = Bouquet.find(params[:id])
    @location = Location.find(@bouquet.location_id)
  end

  def show
    @bouquet = Bouquet.find(params[:id])
    @location = Location.find(@bouquet.location_id)
  end

end
