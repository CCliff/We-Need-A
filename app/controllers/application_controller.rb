require 'sinatra/base'

class ApplicationController < Sinatra::Base

  # Applies the activerecordextension module for the modular Sinatra app
  register Sinatra::ActiveRecordExtension
  # Enables sessions so users can log in and be authenticated
  enable :sessions
  # sets the views folder to be in the app directory
  # unused in this server side app
    # set :views, File.expand_path('../../views', __FILE__)
end