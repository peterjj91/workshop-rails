class Web::Common::Articles::CommentsController < Web::Common::Articles::ApplicationController
  before_action :set_article
  
  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
  
  def comment_params
    params.require(:article_comment).permit(:text)
  end
end
