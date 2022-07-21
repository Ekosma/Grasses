class UsersController < ApplicationController

  get '/users/login' do
    if !current_user
      erb :'/users/login'
    else
      erb :index
    end
  end

  post '/users/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/index'
    else
      erb :'/users/create_user'
    end
  end

  get '/users/create_user' do
    if !logged_in?
      erb :'/users/create_user'
    else
      redirect to "/index"
    end
  end

  post '/users/create_user' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect to 'index'
    end
  end

  get '/users/logout' do
    session.clear
    erb :'/users/logout'
  end

end