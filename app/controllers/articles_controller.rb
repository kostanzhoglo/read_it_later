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
    if !params["topic"]["name"].empty?
      @article.topic = Topic.create(name: params["topic"]["name"])
    end
    @article.save
    redirect "articles/#{@article.id}"
  end

end
