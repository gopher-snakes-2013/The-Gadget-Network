source 'https://rubygems.org'
ruby "1.9.3"

gem 'sinatra'
gem 'sinatra-activerecord'

group :production, :staging do
  gem 'pg'
end

group :development, :test do
  gem 'dotenv'
  gem 'sqlite3'
  gem 'shotgun'
  gem 'capybara'
  gem 'rspec'
  gem 'shoulda-matchers'
  gem 'faker'
end

