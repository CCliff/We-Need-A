class SessionsController < ApplicationController

  post '/new' do
    user = User.find_by(username: params[:username])
    if user && user.password == params[:password]
      session[:current_user] = user.id
      {userId: user.id}.to_json
    else
      false.to_json
    end
  end

  post '/delete' do
    session[:current_user] = nil
  end

end