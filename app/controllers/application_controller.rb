require 'sinatra/base'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  enable :sessions

  set :views, File.expand_path('../../views', __FILE__)
end