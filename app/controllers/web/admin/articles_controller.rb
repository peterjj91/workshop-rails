class Web::Admin::ArticlesController < Web::Admin::ApplicationController

  before_action :set_articles, only: %i[index]
  before_action :set_article, only: %i[show edit update destroy]

  def index; end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:web, :admin, @article]
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to [:web, :admin, @article]
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to :web_admin_articles, notice: 'Test deleted!'
    else
      render plain: 'Not deleted'
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
