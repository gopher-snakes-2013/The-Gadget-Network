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

enable :sessions

get '/' do
  if session[:banana]
    redirect '/feedpage'
  else
    @user = User.new
    erb :index
  end
end

get '/feedpage' do
  p session[:banana]
  @posts = Post.all
  erb :feedpage
end

post '/feedpage' do
  Post.create!(params)
  redirect '/feedpage'
end

post '/' do
  @user = User.new(params[:user])
  if @user.save
    p "successfully saved user"
    redirect '/feedpage'
  else
    erb :index
  end
end

post '/signin' do
  p @currentuser = User.where(user_name: params[:user_name])[0]
  if @currentuser != nil
    if @currentuser.password == params[:password]
      session[:banana] = @currentuser.id
      p "*" * 80
      p "hello"
     redirect '/feedpage'
    else
      p "*" * 80
      p "User exists, failed password"
     redirect '/'
    end
  else
   p "User does not exist"
   redirect '/'
 end
end 


get '/logout' do
  p "before: #{session[:banana]}"
  session.clear
  p "after: #{session[:banana]}"
  p "destroyed the session"
  redirect '/'
end
