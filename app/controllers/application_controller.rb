require 'sinatra/base'

class ApplicationController < Sinatra::Base

    error 401 do
      {error: 'BLAHHHHHHHH'}.to_json
    end

  # Applies the activerecordextension module for the modular Sinatra app
  register Sinatra::ActiveRecordExtension
  # Enables sessions so users can log in and be authenticated
  enable :sessions
  # sets the views folder to be in the app directory
  include Sinatra::AuthenticationHelper
end