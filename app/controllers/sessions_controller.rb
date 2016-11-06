class SessionsController < ApplicationController
  skip_before_filter :set_current_user # tells rails to skip this method

  def create # for login/register
<<<<<<< HEAD
    spotify_user = RSpotify::User.new(request.env['omniauth.auth']) # get a spotify user using omniauth token
    user = User.find_by_uid(spotify_user.id)|| # lookup by id
              User.create_with_omniauth(spotify_user) # if no user is found create one
    session[:session_token] = user.session_token
    user_id = spotify_user.id
    redirect_to controller: 'playlists', action: 'index',  user_id: user_id # pass user id to playlists controller
=======
    byebug

    auth = RSpotify::User.new(request.env['omniauth.auth']) # get a spotify user using omniauth token
    user = User.find_by_uid(auth.id)|| # lookup by id
              User.create_with_omniauth(auth) # if no user is found create one
    session[:session_token] = user.session_token
    byebug
    redirect_to playlists_index_url
>>>>>>> 3608938... added some testing stuff...nothing works yet
  end

  def destroy # for logout
    session[:session_token] = nil
    redirect_to root_url
  end
end



