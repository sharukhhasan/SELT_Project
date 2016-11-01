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

  def create_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
end
