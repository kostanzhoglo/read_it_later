require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Error: Please don't leave any fields blank when signing up."
      redirect '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Successfully signed in."
      redirect '/topics'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/topics'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "Successfully logged in."
      redirect '/topics'
    else
      flash[:message] = "Error: Something went wrong. Please enter your username and password again."
      redirect '/login'
    end
  end

  get '/logout' do
    if !logged_in?
      flash[:message] = "You weren't logged in!"      
      redirect '/'
    else
      session.clear
      flash[:message] = "Successfully logged out."
      redirect '/login'
    end
  end

end
