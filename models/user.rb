class User < ActiveRecord::Base
  has_many :posts
  validates :user_name, :email, uniqueness: true
  validates :first_name, :last_name, :password, presence: true
end
