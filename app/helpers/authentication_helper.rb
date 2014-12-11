module Sinatra
  module AuthenticationHelper

    def current_user
      if session[:current_user]
        current_user ||= User.find(session[:current_user])
      else
        nil
      end
    end

    def authenticate!
      error 401 unless current_user
    end
  end
  helpers AuthenticationHelper
end