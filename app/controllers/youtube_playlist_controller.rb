class YoutubePlaylistController < ApplicationController
  before_filter :set_current_user

  def index
    @playlist_name = params[:name]
    spotify_user = RSpotify::User.find(@current_user.uid) # use wrapper to fetch user
    user_playlists = spotify_user.playlists # fetch playlists from wrapper object
    @selected_playlist = user_playlists.find {|playlist| playlist.name == @playlist_name}
  end

  def loggedin
    byebug
  end
end
