
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do 
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end 

  get '/articles/new' do 
    @article = Article.new
    erb :new
  end 

  post '/articles' do 
    @articles_show = Article.create(params)
    redirect to "/articles/#{@articles_show.id}"
  end 

end
