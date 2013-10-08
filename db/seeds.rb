# require '../app/models/user'


class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
end


User.create!(first_name: "Gary", last_name: "Tsai", user_name: "gary1410")
