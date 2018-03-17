require 'rack-flash'

class ArticlesController < ApplicationController
  use Rack::Flash

  get '/articles/new' do
    if !logged_in?
      flash[:message] = "You have to be logged in to see that."
      redirect '/login'
    else
      erb :'/articles/new'
    end
  end


  post '/articles' do
    if params[:title] == "" || params[:url] == ""
      flash[:message] = "Error. You can't leave Article Title or Web Address blank. Please try again."
      redirect '/articles/new'
    else
      @article = Article.create(title: params[:title], url: params[:url])
      if !params[:name].empty?
        @article.topic = Topic.find_or_create_by(name: params[:name])
        @article.save
        @topic = @article.topic
        @topic.user = current_user
        @topic.save
        redirect "/articles/#{@article.slug}"
      else
        @article.topic = Topic.find_by(id: params["topic_id"])
        @article.save
        @topic = @article.topic
        @topic.user = current_user
        @topic.save
        redirect "/articles/#{@article.slug}"
      end
    end
  end

  get '/articles/:slug' do
    @article = Article.find_by_slug(params[:slug])
    erb :'/articles/show'
  end

  get '/articles/:slug/edit' do
    if !logged_in?
      flash[:message] = "You have to be logged in to see that."
      redirect '/login'
    else
      @article = Article.find_by_slug(params[:slug])
      binding.pry
      erb :'/articles/edit'
      if @article && @article.topic.user == current_user
        erb :'/articles/edit'
      else
        flash[:message] = "HEY you! Only the creator of this article can edit it."
        redirect '/topics'
      end
    end
  end

  patch '/articles/:slug' do
    @article = Article.find_by_slug(params[:slug])
    if params[:title] == "" || params[:url] == ""
      flash[:message] = "Error. You can't leave Article Title or Web Address blank. Please try again."
      redirect "/articles/#{@article.slug}/edit"
    else
      @article.update(title: params[:title], url: params[:url])
      if !params[:name].empty?
        @article.topic = Topic.find_or_create_by(name: params[:name])
        @article.save
        @topic = @article.topic
        @topic.user = current_user
        @topic.save
        redirect "/articles/#{@article.slug}"
      else
        @article.topic = Topic.find_by(id: params["topic_id"])
        @article.save
        @topic = @article.topic
        @topic.user = current_user
        @topic.save
        redirect "/articles/#{@article.slug}"
      end
    end
  end


end
