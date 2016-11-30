class PlaylistsController < ApplicationController
  before_filter :set_current_user

  def new
  end

  def index # renders playlists/index view
    if @current_user.respond_to?(:uid)
      if params[:search].present?
        @user_playlists = RSpotify::Playlist.search(params[:search])
      else
        spotify_user = RSpotify::User.find(@current_user.uid) # use wrapper to fetch user
        @user_playlists = spotify_user.playlists # fetch playlists from wrapper object
      end
      @track = Hash.new
      @user_playlists.each do |playlist|
        playlist.tracks.each do |track|
          @track[track.name] = track
        end
      end
    end
  end
end
