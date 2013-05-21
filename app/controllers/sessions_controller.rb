class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_omniauth(auth_hash)
    if user.present?
      session[:current_user_id] = user.id
    end
    redirect_to '/'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
