class ArticlesController < ApplicationController
  before_action :set_id, only: %i[show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :asc)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article #{@article.title} saved successfully."
    else
      flash.alert = 'Failed to save article.'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article has been updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_id
    @article = Article.find(params[:id])
  end
end
