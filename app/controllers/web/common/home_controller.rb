class Web::Common::HomeController < Web::Common::ApplicationController
  def index
    @articles = Article.unarchived_and_published.last(2)
  end
end
