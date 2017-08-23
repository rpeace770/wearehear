
class BouquetsController < ApplicationController

  def index
    @bouquets = Bouquet.all
    @locations = []
    location_hash = Bouquet.group("location_id").count
    new_location_hash = location_hash.sort_by {|key, value| value}.reverse.to_h
    location_array = new_location_hash.keys.slice(0, 5)
    location_array.each do |location|
      @locations << Location.find(location)
    end

    @songs = []
    song_hash = Bouquet.group("song_id").count
    new_song_hash = song_hash.sort_by {|key, value| value}.reverse.to_h
    song_array = new_song_hash.keys.slice(0, 5)
    song_array.each do |song|
      @songs << Song.find(song)
    end

  end

  def all
    @locations = Location.all
    render json: @locations.to_json
  end

  def about
  end

  def locations
    locations = []
    user = User.find(current_user.id)
    bouquets = user.sent_bouquets.order("created_at")
    bouquets.each do |bouquet|
      locations << Location.find(bouquet.location_id)
    end
    render json: locations.to_json
  end

  def messages
    comments = []
    user = User.find(current_user.id)
    bouquets = user.sent_bouquets.order("created_at")
    render json: bouquets.to_json
  end

  def new
  end

  def create

    @song = Song.find_or_create_by(song_params)
    @location = Location.find_or_create_by(location_params)
    @bouquet = Bouquet.new(bouquet_params)
    @bouquet.upload_image(params[:bouquet][:image])
    @bouquet.sender_id = current_user.id
    @bouquet.location_id = @location.id
    @bouquet.song_id = @song.id
    if @bouquet.save
      session[:notice] = "Your bouquet was sent!"
       binding.pry
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
    if current_user.id == @bouquet.sender_id || params[:secret] == @bouquet.secret
      @location = Location.find(@bouquet.location_id)
    else
      redirect_to '/'
    end
  end

  def destroy
    bouquet = Bouquet.find(params[:id])
    bouquet.destroy
    redirect_to '/bouquets/new'
  end

  private
    def bouquet_params
      params.require(:bouquet).permit(:sender_name, :receiver_name, :custom_location, :comment, :image)
    end

    def song_params
      params.require(:song).permit(:track, :artist, :spotify_id, :album)
    end

    def location_params
      params.require(:location).permit(:lat, :lng)
    end
end
