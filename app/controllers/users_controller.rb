class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    if params[:password] == "" || params[:username] == ""
      redirect to "/users/new"
    end    
    #make sure username does not already exist : user.id = nil
    @user = User.find_by(username: params[:username])
    
    if !@user #.nil? big mike is the best
      #create user
      @user = User.create(username: params[:username], password: params[:password])
      redirect "/users"
    else
      "error post /users/new route"
    end    
    
    #log them in  with a session
    session[:user_id] = @user.id
    
    redirect to '/'
    
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find(params[:id])
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    # binding.pry
    @user = User.find(params[:id])
    @user.update(username: params[:username], password: params[:password])
    redirect to "/users/#{@user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    @user = User.find(params[:id])
    @user.destroy
    redirect "/users"
  end

  get "/login" do
    erb :"/users/login.html"
  end

  post '/login' do #<----from USER LOG IN
    #if USERNAME TEXT BOX has not changed from my default value set input
    #set the USERNAME to what is in the actual database
    if params[:username] == "SUPERINTENDENT"
      params[:username] = "superintendent"  
    end

    @user = User.find_by(username: params[:username])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/'
    else
      flash[:message] = "incorrect username and/or password - please, try again"
      redirect to "/login"
    end







      # if @user = User.find_by(username: params[:username])
      #   if @user.authenticate(params[:password]) #<---true = correct password
      #     session[:user_id] = @user.id #?Yup...this is the act of "logging in"
      #     redirect to '/'
      #   else
      #     redirect to "/login"
      #     #error handling - if password doesn't match user.password
      #   end
      # else
      #   redirect to "/login"
      #   #error handling - if user isn't found    
      # end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/signup' do
    erb :"/users/signup.html"
  end

  post '/signup' do
    #validate by checking if params != ""
    if params[:password] == "" || params[:username] == ""
      redirect to '/signup'
    end    
    #make sure username does not already exist : user.id = nil
    @user = User.find_by(username: params[:username])    
    if !@user #.nil? big mike is the best
      #create user
      @user = User.create(username: params[:username], password: params[:password])
      redirect '/'
    else
      "error post /signup route"
    end
    #log them in  with a session
    session[:user_id] = @user.id
    redirect to '/'
  end
  

end
