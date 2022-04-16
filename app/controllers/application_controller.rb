require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable Sinatra Sessions - for UserPassword goodness
    enable :sessions
    set :session_secret, "stringOfTeXt"
    #enable Flash Messages
    register Sinatra::Flash 
  end

  helpers do
    def logged_in?
        !!current_user
    end

    def current_user
        #if current_user exists - then...yeah it exists.. IF NOT - create the instance variable
       current_user ||= User.find_by(id: session[:user_id])
    end
  end

  get "/" do
    erb :welcome
  end

end
