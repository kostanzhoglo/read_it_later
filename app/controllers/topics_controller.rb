require 'rack-flash'

class TopicsController < ApplicationController
  use Rack::Flash

  get '/topics' do
    if !logged_in?
      flash[:message] = "You have to be logged in to see that."
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
      flash[:message] = "You have to be logged in to see that."
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
      @topic = Topic.new(name: params[:name])
      @topic.user = current_user
      @topic.save
      redirect '/topics'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user != ""
      erb :'/topics/show_users_topics'
    else
      redirect '/topics'
    end
  end

  get '/topics/:slug' do
    if !logged_in?
      flash[:message] = "You have to be logged in to see that."
      redirect '/login'
    else
      @topic = Topic.find_by_slug(params[:slug])
      erb :'/topics/show_single_topic'
    end
  end

  get '/topics/:slug/edit' do
    if !logged_in?
      flash[:message] = "You have to be logged in to see that."
      redirect '/login'
    else
      @topic = Topic.find_by_slug(params[:slug])
      if @topic && @topic.user == current_user
        erb :'/topics/edit'
      else
        flash[:message] = "Only the creator of this topic can edit it."
        redirect '/topics'
      end
    end
  end

end
