require 'bundler'
Bundler.require

# require './connection'
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

require 'dotenv'
Dotenv.load

AWS.config(
access_key_id: ENV['AWS_ACCESS_KEY_ID'],
secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'])

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/app/models/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end
Dir[ROOT_PATH+"/app/helpers/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end

require './app/controllers/application_controller'
require './app/controllers/users_controller'
require './app/controllers/games_controller'
require './app/controllers/welcome_controller'
require './app/controllers/teams_controller'
require './app/controllers/sessions_controller'

map('/api/users'){run UsersController}
map('/api/games'){run GamesController}
map('/api/teams'){run TeamsController}
map('/api/sessions'){run SessionsController}
map('/'){run WelcomeController}