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


