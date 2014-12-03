require 'bundler'
Bundler.require

require './connection'

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/app/models/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end

require './app/controllers/application_controller'
require './app/controllers/users_controller'

map('/api/users'){run UsersController}