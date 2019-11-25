class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def default_url_options
  { locale: I18n.locale }
end
  def index
    @articles = Article.all
  end


   def show
     @article = Article.find(params[:id])
     session[:article_id] = @article.id
   end
def new
  @article = Article.new
end

def edit
  @article = Article.find(params[:id])
end

def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end


private
  def article_params
    params.require(:article).permit(:title, :text)
  end
  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end
end
