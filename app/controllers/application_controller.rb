class ApplicationController < ActionController::Base

  protect_from_forgery
  protected

  def set_current_user

    byebug
    @current_user ||= User.find_by_session_token(session[:session_token])
    puts "current_user is #{@current_user}"
  end

  # def current_user?(id) # this function may come in handy later...
  #   @current_user.id.to_s == id
  # end
end
