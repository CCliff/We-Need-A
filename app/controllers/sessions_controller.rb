class SessionsController < ApplicationController

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.password == params[:password]
      session[:current_user] = user.id
      true.to_json
    else
      false.to_json
    end
  end

  post '/logout' do
    session[:current_user] = nil
  end

end