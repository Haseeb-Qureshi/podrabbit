class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.generate_session_token!
  end

  def log_out!
    return nil if current_user.nil?
    current_user.generate_session_token!
    session[:session_token] = nil
  end
end
