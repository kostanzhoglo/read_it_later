require 'rack-flash'

class TopicsController < ApplicationController
  use Rack::Flash

  get '/topics' do
    if !logged_in?
      redirect '/login'
    else
      @users = User.all
      @user = current_user
      @topics = Topic.all
      erb :'/topics/show'
    end
  end

  get '/topics/new' do
    if !logged_in?
      redirect '/login'
    else
      erb :'/topics/new'
    end
  end

  post '/topics' do
    if params[:name] == ""
      flash[:message] = "Error. You can't leave Topic Name blank. Please try again."
      redirect '/topics/new'
    else
      @topic = Topic.create(name: params[:name])
      redirect '/topics'
    end
  end

end
