class PlaylistsController < ApplicationController
  def new
  end

  def spotify
    @spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    if @spotify_user != nil
      index
    end
  end

  def index
  end
end
