class Post < ActiveRecord::Base
  has_many :comments

  scope :newest_first, ->() { order(created_at: :desc) }
end
