class PlaylistsController < ApplicationController
  before_filter :set_current_user

  def new
  end

  def index # renders playlists/index view
    if @current_user.respond_to?(:uid)
      spotify_user = RSpotify::User.find(@current_user.uid) # use wrapper to fetch user
      @user_playlists = spotify_user.playlists # fetch playlists from wrapper object
    end
  end
end
