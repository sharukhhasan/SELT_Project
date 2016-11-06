class SessionsController < ApplicationController
  skip_before_filter :set_current_user # tells rails to skip this method

  def create # for login/register
    auth = RSpotify::User.new(request.env['omniauth.auth']) # get a spotify user using omniauth token
    user = User.find_by_uid(auth.id)|| # lookup by id
              User.create_with_omniauth(auth) # if no user is found create one
    session[:session_token] = user.session_token
    redirect_to playlists_index_url # todo: pass user object here
  end

  def destroy # for logout
    session[:session_token] = nil
    redirect_to root_url
  end
end
