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
    @article = Article.create(title: params[:title], url: params[:url])
    @article.topic = Topic.find_or_create_by(name: params[:name])
    @article.save
    @topic = @article.topic
    @topic.user = current_user
    # if !params["topic"]["name"].empty?
    #   @article.topic = Topic.create(name: params["topic"]["name"])
    # end
    @topic.save
    redirect "articles/#{@article.id}"
  end



  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :'/articles/show'
  end

end
