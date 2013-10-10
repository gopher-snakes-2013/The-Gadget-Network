class User < ActiveRecord::Base
  has_many :posts
  validates :user_name, presence: true, 
                        uniqueness: true
  validates :email, presence: true,
                    uniqueness: true
  validates :first_name, :last_name, :password, presence: true
end
