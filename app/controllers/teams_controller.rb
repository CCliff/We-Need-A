class TeamsController < ApplicationController

  get '/' do
    content_type :json
    Team.all.to_json
  end

  get '/new' do

  end

  post '/new' do
    Team.create(params[:user])
  end

  get '/:id' do
    content_type:json
    Team.find(params[:id]).to_json
  end

  get '/:id/edit' do
    content_type:json
    Team.find(params[:id]).to_json
  end

  patch '/:id/edit' do
    user = Team.find(params[:id])
    user.update(params[:user])
  end

  delete '/:id' do
    user = Team.find(params[:id])
    user.destroy
  end

end