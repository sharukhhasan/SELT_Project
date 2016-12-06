class UsersController < ApplicationController
  def show
    @user = User.find_by_session_token(session[:session_token])
    @user_display_name = session[:display_name]
    @user_country = session[:country]
    @user_email = session[:email]
    @user_images = session[:images]
    @user_birthday = session[:birthdate]
  end
end
