require 'sinatra/base'

class ApplicationController < Sinatra::Base

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
end