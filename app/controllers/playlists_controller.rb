class PlaylistsController < ApplicationController
  before_filter :set_current_user # executes set_current_user before any action in controller

  def new
  end

  def index # renders playlists/index view
    if params[:user_id].nil? # if user reaches playlists view while already being signed in (no params being passed for session_controler)
      signed_in_user = User.find_by_session_token(session[:session_token]) # grab user from db using session token
      if signed_in_user.nil?
        user_id = nil
      else
        user_id = signed_in_user.uid # fetch users unique spotify id from db
        redirect_to controller: 'playlists', action: 'index',  user_id: user_id # pass user id to playlist controller
      end
    else
      user_id = params[:user_id] # fetch users unique spotify id from parameter (session_controller)
    end
    
    if user_id.nil?
      # todo: handle error (send to error page)-0
    else
      spotify_user = RSpotify::User.find(user_id) # use wrapper to fetch user
      @user_playlists = spotify_user.playlists # fetch playlists from wrapper object
    end
  end
end
