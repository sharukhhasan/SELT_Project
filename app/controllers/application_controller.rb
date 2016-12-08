class ApplicationController < ActionController::Base

  protect_from_forgery
  protected

  def set_current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def settings
    @user = User.find_by_session_token(session[:session_token])
    
    @user_birthday = session[:birthdate]
    @user_email = session[:email]
    @user_image = session[:image_url]
  end

  # def current_user?(id) # this function may come in handy later...
  #   @current_user.id.to_s == id
  # end
end
