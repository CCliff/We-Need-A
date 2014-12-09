require 'sinatra/base'

class ApplicationController < Sinatra::Base

  after { ActiveRecord::Base.connection.close }

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
end