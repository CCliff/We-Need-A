require 'bundler'
Bundler.require

# Allow CORS on Heroku
require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins '*'
    resource '*',
        :headers => :any,
        :methods => [:get, :post, :delete, :put, :options]
  end
end

# database connections
require './connection'
# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

# for environmental variable storage
require 'dotenv'
Dotenv.load

#Connection information to my AWS S3
AWS.config(
access_key_id: ENV['AWS_ACCESS_KEY_ID'],
secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'])

# require application files
ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/app/models/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end
Dir[ROOT_PATH+"/app/helpers/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end

# require controllers in the correct order (application_controller first)
require './app/controllers/application_controller'
require './app/controllers/users_controller'
require './app/controllers/games_controller'
require './app/controllers/welcome_controller'
require './app/controllers/teams_controller'
require './app/controllers/sessions_controller'

# map routes to the correct controllers for routing
map('/api/users'){run UsersController}
map('/api/games'){run GamesController}
map('/api/teams'){run TeamsController}
map('/sessions'){run SessionsController}
map('/'){run WelcomeController}