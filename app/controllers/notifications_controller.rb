class NotificationsController < WebsocketRails::BaseController
  def authorize_channel
    if User.current_user
      accept_channel User.current_user
      WebsocketRails[:notifications].trigger(
        :joined, User.current_user.full_name)
    else
      deny_channel message: 'Authorization failed!'
    end
  end
end
