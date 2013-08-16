jQuery ->
  window.notificationSystem = 
    new NotificationSystem()

class NotificationSystem
  constructor: ->
    @notifications = window.webkitNotifications
    @bindPermissionButton()

  bindPermissionButton: =>
    $("#toggle_notifications").on 'click', @toggle

  toggle: =>
    if window.webkitNotifications
      if window.Notification.permission == 'granted' || !window.webkitNotifications.checkPermission()
        notification = new Notification(
          'Notifications are enabled!',
          {
            'body': 'You will now receive notifications from updates.',
            'tag' : 'toggle_on'
          }
        )

        notification.onclick = () ->
            this.close
      else
        window.webkitNotifications.requestPermission()

    else
      window.alert "Notifications are not supported by your browser"

  message: (title, body) =>
    if window.webkitNotifications
      if window.Notification.permission == 'granted' || !window.webkitNotifications.checkPermission()
        notification = new Notification(
          title,
          {
            'body': body,
            'tag' : 'toggle_on'
          }
        )

        notification.onclick = () ->
            this.close