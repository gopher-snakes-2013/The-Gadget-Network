ENV['RACK_ENV'] ||='test'

require './gadget_network_app'

require 'shoulda-matchers'
require 'capybara/rspec'
require 'faker'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.before do
    User.destroy_all
  end
end

def random_user_attributes
  name = "#{Faker::Name.name} #{SecureRandom.hex(4)}"
  {
    name: name,
    email: "#{name.parameterize}@example.com",
    password: "password"
  }
end