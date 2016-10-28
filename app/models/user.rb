class User < ActiveRecord::Base
  before_save :create_session_token

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth.id
      user.name = auth.display_name
    end
  end

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
