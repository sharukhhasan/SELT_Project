class YoutubePlaylistController < ApplicationController
  before_filter :set_current_user

  def index
    @playlist_name = params[:name]
    spotify_user = RSpotify::User.find(@current_user.uid) # use wrapper to fetch user
    user_playlists = spotify_user.playlists # fetch playlists from wrapper object
    @selected_playlist = user_playlists.find {|playlist| playlist.name == @playlist_name}
  end

  def loggedin
    @yt_account = Yt::Account.new refresh_token: session[:yt_token]
    Yt.configuration.client_id = '1095677510377-98krukjir1j472p4q3g7gb18oej274t2.apps.googleusercontent.com'
    Yt.configuration.client_secret = '4UQ2tXPd9fIaUrOLuNdS9lE'
    Yt.configuration.api_key = 'AIzaSyDl03kJVnB5b62LjXXnPgWKCoG_F4c5uyU'
    # account = session[:yt_token]
    byebug
  end
end
