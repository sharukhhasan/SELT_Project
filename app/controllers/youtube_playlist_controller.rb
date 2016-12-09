
class YoutubePlaylistController < ApplicationController
  before_filter :set_current_user

  def index
    @playlist_name = params[:name]
    @selected_playlist = get_selected_spotify_playlist @playlist_name
    session[:selected_playlist_name] = @playlist_name # store playlist name for future reference
  end

  def yt_logged_in
    config_yt_gem
    @yt_account = Yt::Account.new access_token: session[:yt_token]
    @selected_playlist_name = session[:selected_playlist_name]
    create_yt_playlist @yt_account, @selected_playlist_name
  end

  def config_yt_gem
    Yt.configuration.client_id = '1095677510377-98krukjir1j472p4q3g7gb18oej274t2.apps.googleusercontent.com'
    Yt.configuration.client_secret = '4UQ2tXPd9fIaUrOLuNdS9lE'
    #Yt.configuration.log_level = :debug
    Yt.configuration.api_key = 'AIzaSyDl03kJVnB5b62LjXXnPgWKCoG_F4c5uyU'
  end

  def get_selected_spotify_playlist playlist_name
    spotify_user = RSpotify::User.find(@current_user.uid) # use wrapper to fetch user
    user_playlists = spotify_user.playlists # fetch playlists from wrapper object
    user_playlists.find {|playlist| playlist.name == playlist_name}
  end

  def create_yt_playlist (yt_account, playlist_name)
    new_playlist = yt_account.create_playlist title: playlist_name + ' (Created by Spotitude)'
    @playlist_id = new_playlist.id
    new_playlist.update privacy_status: 'public'
    spotify_playlist = get_selected_spotify_playlist playlist_name
    spotify_playlist.tracks.each do |track|
      search_yt_and_build_playlist new_playlist, track.artists[0].name + ' ' + track.name  + ' song'
    end
  end

  def search_yt_and_build_playlist (new_playlist, search_term)
    videos = Yt::Collections::Videos.new
    video_result = videos.where(q: search_term, safe_search: 'none', order: 'relevance').first
    new_playlist.add_video video_result.id
  end
end

