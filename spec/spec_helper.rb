ENV['RACK_ENV'] ||='test'

require './gadget_network_app'

require 'shoulda-matchers'
require 'capybara/rspec'

Capybara.app = Sinatra::Application
