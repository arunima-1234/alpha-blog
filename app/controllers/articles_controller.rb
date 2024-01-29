class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :delete]

  def show
  end

  def index
    @all_articles = Article.all
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(permit_article_params)
    if @article.save
      flash[:notice] = "Article created successfully !"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(permit_article_params)
      flash[:notice] = "Updated successfully!"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def delete
    @article.destroy

    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def permit_article_params
    params.require(:article).permit(:article_title, :article_description)
  end
end
