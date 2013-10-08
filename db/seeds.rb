# I don't think we need this.  The file we were going off of was seeds.rb in the root directory.  

# require '../app/models/user'


class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
end


User.create!(first_name: "Gary", last_name: "Tsai", user_name: "gary1410")
