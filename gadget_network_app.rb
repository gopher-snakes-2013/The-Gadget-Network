$LOAD_PATH.unshift(File.expand_path('.'))

require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/user'

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

post '/' do
  erb :index
  User.create!("user_name" => params[:user_name], "first_name" => params[:first_name], "last_name" => params[:last_name], "password" => params[:password], "email" => params[:email])
  # redirect '/'
end

get '/signin' do
  # p User.all
  # p User.first.user_name
  # p params[:user_name]
  # p User.all.find_by_user_name(params[:user_name]).password  
  if params[:user_name] != "" 
    if params[:password] == User.all.find_by_user_name(params[:user_name]).password
      erb :signin
    else
      redirect '/'
    end
  else
      redirect '/'
  end
   
end

# post '/signin' do
  

# end
