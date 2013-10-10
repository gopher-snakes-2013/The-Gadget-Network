class Post < ActiveRecord::Base
  belongs_to :user
  validates :feed_entry, presence: true
end
