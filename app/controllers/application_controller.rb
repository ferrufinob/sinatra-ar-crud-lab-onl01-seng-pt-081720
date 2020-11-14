
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
#CREATE
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
     @article =Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  #READ
  get '/articles' do
    #grab all articles and store them in @articles
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    #show an individual article
    #use AR to grab the article with the id that is in 
    #the params and set it equal to @article
    @article = Article.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  #DELETE
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect to "/articles"
  end

end
