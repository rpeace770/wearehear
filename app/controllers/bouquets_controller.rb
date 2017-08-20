
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
    @song = Song.find_or_create_by(song_params)
    @location = Location.find_or_create_by(location_params)
    @bouquet = Bouquet.new(bouquet_params)
    @bouquet.sender_id = current_user.id
    @bouquet.location_id = @location.id
    @bouquet.song_id = @song.id
    if @bouquet.save
      redirect_to "/bouquets/confirm/#{@bouquet.id}"
    else
      redirect_to "/bouquets/new"
    end
  end

  def confirm
    @bouquet = Bouquet.find(params[:id])
    @location = Location.find(@bouquet.location_id)
  end

  def show
    @bouquet = Bouquet.find(params[:id])
    @location = Location.find(@bouquet.location_id)
  end

  private
    def bouquet_params
      params.require(:bouquet).permit(:sender_name, :receiver_name, :custom_location, :comment)
    end

    def song_params
      params.require(:song).permit(:track, :artist, :album)
    end

    def location_params
      params.require(:location).permit(:lat, :lng)
    end
end
