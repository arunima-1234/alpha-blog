class ArticlesController < ApplicationController
  include SessionsHelper

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @all_articles = Article.all
    # @all_articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new()
  end

  def create
    @article = Article.create!(permit_article_params)
    @article.user = current_user
    if @article.persisted?
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

  def destroy
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
