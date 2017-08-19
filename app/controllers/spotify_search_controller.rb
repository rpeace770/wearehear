class Spotify_SearchController < ApplicationController

  def search
     @music = Rspotify::Artist.search(params[:search])
     render :json => @music

    end

end
