class ApplicationController < ActionController::Base
helper_method :current_user

  def login(user)
    @user = user
    @user.reset_session_token!
    session[:session_token] = @user.session_token
    # does there need to be more logic in here??
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

end
