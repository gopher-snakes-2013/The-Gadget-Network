require 'sinatra'

def reverse (string)
  string.reverse
end

get '/' do
  "Hello world"
end
