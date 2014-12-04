class WelcomeController < ApplicationController

  get '/' do

  end

  get '/console' do
    binding.pry
  end

end