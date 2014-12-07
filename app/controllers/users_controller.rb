class UsersController < ApplicationController

  get '/' do
    content_type :json
    User.sport(params['sport']).location(params['locations']).to_json
  end

  get '/new' do

  end

  post '/new' do
    user = User.new(username: params[:username])
    user.password = params[:password]
    user.save!
  end

  get '/:id' do
    content_type:json
    User.find(params[:id]).to_json
  end

  get '/:id/edit' do
    content_type:json
    User.find(params[:id]).to_json
  end

  patch '/:id/edit' do
    user = User.find(params[:id])
    user.update(params[:user])
  end

  delete '/:id' do
    user = User.find(params[:id])
    user.destroy
  end

end