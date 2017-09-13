class SessionsController < ApplicationController

  def new
    redirect_to '/auth/starladder'
  end

  def create
    self.current_user = User.find_or_create_with_omniauth(auth_hash)

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
