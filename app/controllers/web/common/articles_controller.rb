class Web::Common::ArticlesController < Web::Common::ApplicationController

  before_action :set_articles, only: %i[index]
  before_action :set_article, only: %i[show]

  def index; end

  private

  def set_articles
    @articles = Article.all
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
