class TopicsController < ApplicationController

  get '/topics' do
    if !logged_in
      redirect '/login'
    else
      @user = current_user
      erb :'/topics/show'
    end
  end

end
