class WelcomeController < ApplicationController


  get '/' do
    binding.pry
    erb :index
  end

  get '/console' do
    binding.pry
  end

end