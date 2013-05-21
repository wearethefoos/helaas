class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_filter :set_current_user

  def set_current_user
    if id = session[:current_user_id]
      User.current_user = User.find(id)
    end
  end
end
