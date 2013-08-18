class Post < ActiveRecord::Base
  belongs_to :user
  has_many   :comments

  validates_presence_of :content

  scope :newest_first, ->() { order(created_at: :desc) }
end
