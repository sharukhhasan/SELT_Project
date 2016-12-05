class User < ActiveRecord::Base
  before_save :create_session_token
  has_one :profile, autosave: true
  has_one :image, :foreign_key => :author_id, dependent: :destroy
  accepts_nested_attributes_for :profile

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