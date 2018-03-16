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
        redirect "articles/#{@article.id}"
      else
        @article.topic = Topic.find_by(id: params["topic_id"])
        @article.save
        @topic = @article.topic
        @topic.user = current_user
        @topic.save
        redirect "articles/#{@article.id}"
      end
    end
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :'/articles/show'
  end

  get '/articles/:id/edit' do
    if !logged_in?
      flash[:message] = "You have to be logged in to see that."
      redirect '/login'
    else
      @article = Article.find_by_id(params[:id])
      if @article && @article.user == current_user
        erb :'/articles/edit'
      else
        flash[:message] = "Only the creator of this topic can edit it."
        redirect '/topics'
      end
    end
  end

  patch '/articles/:id' do
    raise params.inspect
  end


end
