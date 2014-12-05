require 'bundler'
Bundler.require

require './connection'
require './env' if File.exists?('env.rb')

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/app/models/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end

use Rack::Session::Cookie, :secret => 'wnag01221989'

use OmniAuth::Builder do
  provider :facebook, ENV['APP_ID'], ENV['APP_SECRET']
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