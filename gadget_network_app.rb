$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/user'
require_relative './models/post'

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
  User.create!( {user_name: params[:user_name], email: params[:email], first_name: params[:first_name], last_name: params[:last_name], password: params[:password] } )
  erb :index
end

post '/signin' do
  p @currentuser = User.where(user_name: params[:user_name])[0]
  if @currentuser != nil
    if @currentuser.password == params[:password]
      p "hello"
     redirect '/feedpage'
    else
      p "User exists, failed password"
     redirect '/'
    end
  else
   p "User does not exist"
   redirect '/'
 end
end

get '/find_members' do
  erb :find_members
end

post '/search' do
  
  redirect '/find_members'
end
