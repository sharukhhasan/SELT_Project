class User < ActiveRecord::Base
  before_save :create_session_token

  def self.create_with_omniauth(auth)
    create! do |user|
      if auth.display_name == nil
        user.name = auth.email
      else
        user.name = auth.display_name
      end
      user.uid = auth.id
    end
  end

  # def self.get_selected_spotify_playlist playlist_name
  #   spotify_user = RSpotify::User.find(@current_user.uid) # use wrapper to fetch user
  #   user_playlists = spotify_user.playlists # fetch playlists from wrapper object
  #   user_playlists.find {|playlist| playlist.name == playlist_name}
  # end

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
