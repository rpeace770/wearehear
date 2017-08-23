require 'json'

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to "/"
    end


    # access_token = ENV['ACCESS_TOKEN']
    client_token = Base64.strict_encode64("7a4280c69bd540d588a6540f043ffa48:b07dd2e7bab84c498c5e804b64a267eb")
    # spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
    # parsed_token = JSON.parse(spotify_token)

      if current_user.token_expired?
        token_info = RestClient.post("https://accounts.spotify.com/api/token",{"Authorization": "Basic #{client_token}"}, {"grant_type": "refresh_token", "refresh_token": "#{current_user.refresh_token}"}.to_json)
        binding.pry
      end

      if @user.playlist == nil
        playlist = RestClient.post("https://api.spotify.com/v1/users/#{current_user.uid}/playlists",{name: 'We Are Hear' }.to_json, {"Authorization": "Bearer #{current_user.token}","Content-Type": "application/json"})
        parse_playlist = JSON.parse(playlist)
        @user.playlist = parse_playlist["id"]
        @user.save
      end
      if @user.sent_bouquets
        tracks_array = []
        current_user.sent_bouquets.each do |bouquet|
          song = Song.find(bouquet.song_id)
          tracks_array << "spotify:track:#{song.spotify_id}"
        tracks = RestClient.put("https://api.spotify.com/v1/users/#{current_user.uid}/playlists/#{current_user.playlist}/tracks", {"uris": tracks_array}.to_json, {"Authorization": "Bearer #{current_user.token}","Content-Type": "application/json"})
        parsed_tracks = JSON.parse(tracks)
        @playlist_tracks_id = parsed_tracks["snapshot_id"]
        end
      end


  end

end
