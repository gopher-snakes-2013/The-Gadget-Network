require File.dirname(__FILE__) + '/reverse.rb'
require 'rack/test'

set :environment, :test

def app
  Sinatra::Application
end

#Test to see if the app loads
describe 'Reverse Service' do
  include Rack::Test::Methods
  it "should load the home page" do
    get '/'
    last_response.should be_ok
  end
end


