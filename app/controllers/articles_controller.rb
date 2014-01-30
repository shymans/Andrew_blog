class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_url
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.user_id == current_user
      @article.destroy
      redirect_to articles_path
    else
      redirect_to articles_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
