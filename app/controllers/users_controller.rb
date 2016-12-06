class UsersController < ApplicationController
  def show
    @user = User.find_by_session_token(session[:session_token])
    
    @user_birthday = session[:birthdate]
    @user_email = session[:email]
  end
end
