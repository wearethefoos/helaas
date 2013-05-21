class Post < ActiveRecord::Base
  has_many :comments

  validates_presence_of :content

  scope :newest_first, ->() { order(created_at: :desc) }
end
