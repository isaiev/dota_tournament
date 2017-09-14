class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :init_current_user
  before_action :authenticate

  def init_current_user
    self.current_user = User.find(session_id) if session_id
  end

  def current_user=(user)
    return unless user

    session[:user_id] = user.id
    @current_user = user
  end

  def authenticate
    unauthorized unless @current_user
  end

  def unauthorized
    head 401
  end

  def forbidden
    head 403
  end

  private

  def session_id
    session[:user_id]
  end

end
