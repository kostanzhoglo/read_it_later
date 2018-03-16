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
      # binding.pry
    @article = Article.create(title: params[:title], url: params[:url])
    if !params[:name].empty?
      @article.topic = Topic.find_or_create_by(name: params[:name])
      @article.save
      @topic = @article.topic
      @topic.user = current_user
      @topic.save
      flash[:message] = "Did I get here?"
      redirect "articles/#{@article.id}"
    else
      @article.topic = Topic.find_by(id: params["topic_id"])
      @article.save
      @topic = @article.topic
      binding.pry
      @topic.user = current_user

      @topic.save
      redirect "articles/#{@article.id}"
    end
  end



  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :'/articles/show'
  end

end
