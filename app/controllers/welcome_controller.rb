class WelcomeController < ApplicationController


  # get '/' do
  #   binding.pry
  #   erb :index
  # end

  get '/console' do
    # debugging purposes
    binding.pry
  end

end