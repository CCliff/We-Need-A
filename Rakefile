require 'bundler'
Bundler.require

require 'faker'
require 'pry'
require 'sinatra/activerecord/rake'
require './env' if File.exists?('env.rb')
require_relative 'connection.rb'

ROOT_PATH = Dir.pwd
Dir[ROOT_PATH+"/app/models/*.rb"].each do |file|
  require file
  puts "requiring #{file}"
end

namespace :db do
  desc "add junk data to the db"
  task :junk_data do

    sports = ['basketball', 'softball', 'roller hockey', 'bowling']
    locations = ['manhattan', 'brooklyn', 'queens']

    100.times do
      User.create(username: Faker::Name.name, sports: sports.sample(rand(sports.length)+1).join(','), locations: locations.sample(rand(locations.length)+1).join(',') )
    end
    users = User.all

    20.times do
      user = users.sample
      Team.create(user_id: user.id, teamName: Faker::Address.city, sport: sports.sample)
    end
    teams = Team.all
    50.times do
      team = teams.sample
      Game.create(team_id: team.id, date: Faker::Date.forward(30), location: locations.sample)
    end
  end
end