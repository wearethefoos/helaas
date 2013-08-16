jQuery ->
  window.notificationController =
    new NotificationsController $('#notifications').data('uri'), true

class NotificationsController
  constructor: (url, useWebsockets) ->
    @messageQueue = []
    @dispatcher = new WebSocketRails url
    @dispatcher.on_open = @subscribeUser

  bindEvents: =>
    @channel.bind 'joined', @userJoined
    @channel.bind 'new_post', @newMessage
    console.log @channel

  newMessage: (message) =>
    @messageQueue.push message
    @shiftMessageQueue() if @messageQueue.length > 15
    @appendMessage message

  subscribeUser: (data) =>
    @channel = @dispatcher.subscribe_private 'notifications'
    @bindEvents()

  userJoined: (current_user) ->
    console.log current_user

  appendMessage: (message) =>
    $("#notifications").append message.content
    window.notificationSystem.message "New Post!", message.content

  postList: =>
    $ "#posts"

