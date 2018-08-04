class Web::Admin::ArticlesController < Web::Admin::ApplicationController

  before_action :set_articles, only: %i[index]
  before_action :set_article, only: %i[show]

  def index; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:web, :admin, @article]
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_articles
    @articles = Article.all
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
