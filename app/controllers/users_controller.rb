class UsersController < ApplicationController
  def settings
    @user = User.find_by_session_token(session[:session_token])
    
    @user_email = session[:email]
    @user_image = session[:image_url]
    @user_country = session[:country]
    @user_followers = session[:followers]
    @user_display_name = session[:display_name]
  end
end
