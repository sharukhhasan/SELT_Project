class SessionsController < ApplicationController
  skip_before_filter :set_current_user # tells rails to skip this method

  def create # for login/register
    auth_spotify_user = RSpotify::User.new(auth_hash) # get a spotify user using omniauth token
    user = User.find_by_uid(auth_spotify_user.id)|| # lookup by id
              User.create_with_omniauth(auth_spotify_user) # if no user is found create one
    session[:session_token] = user.session_token
    redirect_to playlists_index_url
    # This is a different option \/ \/ \/
    # redirect_to controller: 'playlists', action: 'index',  user_id: user_id # pass user id to playlists controller
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def destroy # for logout
    session[:session_token] = nil
    redirect_to root_url
  end
end



