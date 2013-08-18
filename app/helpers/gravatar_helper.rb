module GravatarHelper
  def gravatar(user, width=1)
    hash = Digest::MD5.hexdigest(user.email.downcase)
    image_tag "http://www.gravatar.com/avatar/#{hash}", class: "span-avatar#{width} avatar"
  end
end