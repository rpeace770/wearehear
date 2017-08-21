

class SpotifySearchController < ApplicationController
  def index

  	spotify_url = "https://api.spotify.com/v1/"
    query = params[:search].gsub(/ /, "%20")
    searchURL = "#{spotify_url}search?q=#{query}&type=artist,track&limit=10"
    access_token = ENV['ACCESS_TOKEN']
    # getting client token
    client_token = Base64.strict_encode64("7a4280c69bd540d588a6540f043ffa48:b07dd2e7bab84c498c5e804b64a267eb")

    spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})

    parsed_token = JSON.parse(spotify_token)
    # grab the spotify data for the corresponding artist
    response = RestClient.get(searchURL, {"Authorization": "Bearer #{parsed_token["access_token"]}"})
    # return that artist's top tracks
    @artist_data = JSON.parse(response)["artists"]["items"]

    @artist_return = @artist_data.slice(0,10)

    @tracks = JSON.parse(response)["tracks"]["items"]

    #return songs  from search results
    @songs = []
    @tracks.each do |song|
      @songs << { track_id: song["id"],
                  song_title: song["name"],
                  album_name: song["album"]["name"],
                  artists_name: song["artists"][0]["name"]
                  }
    end


     top_tracks_results = []
     @artist_return.each do |artist|
      top_tracks_url = "https://api.spotify.com/v1/artists/#{artist["id"]}/top-tracks?country=US&limit=1"
      top_tracks_results << JSON.parse(RestClient.get(top_tracks_url, {"Authorization": "Bearer #{parsed_token["access_token"]}"}))
     end

      @tracks_info = []
      top_tracks_results.each do |track|
         if track["tracks"].length > 0

          @tracks_info << { track_id: track["tracks"][0]["id"],
                            song_title: track["tracks"][0]["name"],
                            album_name: track["tracks"][0]["album"]["name"],
                            artist_name: track["tracks"][0]["artists"][0]["name"] }
        end
       end

    #render json: {tracks: @tracks_info, artist_data: @artist_data}
    render :_results, locals: { artist: @tracks_info, tracks: @songs}, layout: false
  end

end
















	# uri = URI.parse("https://api.spotify.com/v1/search")
	# request = Net::HTTP::Get.new(uri)
	# request["Accept"] = "application/json"
	# request["Authorization"] = "Bearer BQBJZwWgnvG44Iat8GK-_wwUandZaBLjZL8Tw88TvO_286QdWHfrEMsB0oPE5LVNXotd1S6_KauRndTbf7L59DfLIVX3JlFBEVJ1bX1iIK8WNlsR0YiZkHC_EUnJLloBsWHK-RwUA8pkXqLJ_AyzpGIJp3dyQXESHQe3njMEalP5tgHRn9rlMKarDQplotGOIDDdWQwYCbKTnm7guQaq5NbONEF1ElypctznW0rBXueAKYl6N0yAqFiDkytL1JPqvn6qRzeyA4-8l07Q4k1coELDh5pJK_lQC1nUhfjO_nYQ5YnKYlKd6Z7i-Q_8agN9vKSVFQ"

	# req_options = {
	#   use_ssl: uri.scheme == "https",
	# }

	# response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
	#   http.request(request)
	# end

 #  end

