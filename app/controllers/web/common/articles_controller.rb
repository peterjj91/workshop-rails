class Web::Common::ArticlesController < Web::Common::ApplicationController
  before_action :set_article, only: [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.unarchived_and_published
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comments = @article.comments
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      begin
        @article = Article.find(params[:id])
      rescue
        redirect_to articles_path, notice: 'Not Found.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
