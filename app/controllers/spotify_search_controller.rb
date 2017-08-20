

class SpotifySearchController < ApplicationController
  def index

  	spotify_url = "https://api.spotify.com/v1/"
    query = params[:search].gsub(/ /, "%20")
    searchURL = "#{spotify_url}search?q=#{query}&type=artist,track&limit=50"

    access_token = ENV['ACCESS_TOKEN']

    # getting client token
    client_token = Base64.strict_encode64("7a4280c69bd540d588a6540f043ffa48:b07dd2e7bab84c498c5e804b64a267eb")

    spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})

    parsed_token = JSON.parse(spotify_token)

    # grab the spotify data for the corresponding artist
    response = RestClient.get(searchURL, {"Authorization": "Bearer #{parsed_token["access_token"]}"})
    # return that artist's top tracks
    @artist_data = JSON.parse(response)["artists"]["items"][0]
    #binding.pry
    if @artist_data == nil
      @tracks = ["No results found"]
    else
      top_tracks_url = "https://api.spotify.com/v1/artists/#{@artist_data["id"]}/top-tracks?country=US"

      top_tracks_results = JSON.parse(RestClient.get(top_tracks_url, {"Authorization": "Bearer #{parsed_token["access_token"]}"}))

       @tracks = JSON.parse(response)["tracks"]["items"]

     # binding.pry
      @tracks_info = top_tracks_results["tracks"].map do |track|
        {track_id:track["id"], title: track["name"],  album_id:track["album"]["id"], album_name: track["album"]["name"], album_image: track["album"]["images"][1]["url"]}
      end.flatten
    end
    #render json: {tracks: @tracks_info, artist_data: @artist_data}
    render :results
  end
 #
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

