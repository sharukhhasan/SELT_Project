class PlaylistsController < ApplicationController
  before_filter :set_current_user
  def new
  end

  def index # renders playlists/index view
    byebug
  end
end
