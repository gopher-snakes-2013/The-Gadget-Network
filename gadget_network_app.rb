$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require 'rack-flash'
require_relative './models/user'
require_relative './models/post'

enable :sessions
use Rack::Flash


begin
# This loads environment variables from the .env file
require 'dotenv'
Dotenv.load
rescue LoadError
end

set :database, ENV['DATABASE_URL']

get '/' do
  erb :index
end

get '/feedpage' do
  @posts = Post.all
  erb :feedpage
end

post '/feedpage' do
  Post.create!(params)
  redirect '/feedpage'
end

post '/' do
  # This needed to be in a hash. Setting an instance of user for sessions.
  user = User.create!( {user_name: params[:user_name], email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password] } )

  # Now we need to store the user's information across different routes. This is done by creating a session, and making it equal to the user id (as found in the db). See the helper below. 
  session[:user_id]=user.id
  redirect '/feedpage'
end

post '/signin' do
  # set an instance variable so you can do sessions.
  user = User.where(user_name: params[:user_name])[0]
  if user
    if user.password == params[:password]
      # if the user exists, set a sessions. 
      session[:user_id] = user.id
     redirect '/feedpage'
    else
      # User exists, failed password
      flash[:error] = "Incorrect password. Please try again."

     redirect '/'
    end
  else
   flash[:error] = "Incorrect username/password combination."
   redirect '/'
 end
end

helpers do
  #this methods defines the current user as either already set, or if it isn't, then a lookup of the user as found via the session. 
  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
