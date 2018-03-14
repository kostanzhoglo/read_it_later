class TopicsController < ApplicationController

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

end
