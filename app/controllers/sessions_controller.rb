class SessionsController < ApplicationController
  skip_before_filter :always_logged_in

  def create
    user = User.find_or_create_from_omniauth(auth_hash)
    if user.present?
      session[:current_user_id] = user.id
    end
    redirect_to session[:after_login_path] || '/'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
