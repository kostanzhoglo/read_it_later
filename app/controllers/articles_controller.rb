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
      @topic = @article.topic
      if @article && @topic.user_id == current_user.id
        erb :'/articles/edit'
      else
        flash[:message] = "HEY you! Only the creator of this article can edit it."
        redirect '/topics'
      end
    end
  end

  patch '/articles/:id' do
    # if params[:title] == "" || params[:url] == ""
    #   flash[:message] = "Error. You can't leave Article Title or Web Address blank. Please try again."
    #   redirect '/articles/:id/edit'
    # else
      # @article = Article.find_by_id(params[:id])
      @article = Article.update(title: params[:title], url: params[:url])
      binding.pry
      if !params[:name].empty?
        # binding.pry
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
    # end
  end


end
