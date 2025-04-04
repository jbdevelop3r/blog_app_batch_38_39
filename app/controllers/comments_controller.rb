class CommentsController < ApplicationController
  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments
  end

  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to article_comment_path(@article, @comment), notice: 'Comment updated successfully.'
    else
      flash.alert = 'Failed to update comment.'
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    @comment.destroy
    redirect_to article_path(@article), notice: 'Comment has been deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
