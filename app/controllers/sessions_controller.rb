class SessionsController < ApplicationController
  skip_before_filter :set_current_user # tells rails to skip this method


  def create # for login/register
    auth_spotify_user = RSpotify::User.new(auth_hash) # get a spotify user using omniauth token
    user = User.find_by_uid(auth_spotify_user.id)|| # lookup by id
              User.create_with_omniauth(auth_spotify_user) # if no user is found create one
    session[:session_token] = user[:session_token]
    session[:country] = auth_spotify_user.country
    session[:followers] = auth_spotify_user.followers.total
    session[:display_name] = auth_spotify_user.display_name

    redirect_to root_url
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def youtube_create
    session[:yt_token] = auth_hash.credentials[:token]
    redirect_to youtube_logged_in_url
  end

  def destroy # for logout
    session[:session_token] = nil
    redirect_to root_url
  end
end
