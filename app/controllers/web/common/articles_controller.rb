class Web::Common::ArticlesController < Web::Common::ApplicationController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.unarchived_and_published
  end

  def show
    @comments = @article.comments
  end

  private
  
  def set_article
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to articles_path, notice: 'Not Found.'
    end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
