require File.dirname(__FILE__) + '/helloworld.rb'
#In order to test with sinatra we need to require rack/test
require 'rack/test'

#
set :environment, :test

# without this you get the error
# undefined local variable or method `app'
def app
  Sinatra::Application
end


describe 'Page is online' do
  #include necessary methods
  include Rack::Test::Methods #can use get '/'
  it 'should load the home page' do
    get '/'
    #last_response = 
    last_response.should be_ok
  end

  it 'should say hello world' do
    get '/'
    last_response.body == 'Hello world'
  end
end



# describe 'Hello World' do
#   it "Says hello world" do
# end

# end
