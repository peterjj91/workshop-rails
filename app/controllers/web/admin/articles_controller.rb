class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :unarchieve, :archieve]

  def index
    @articles_unarchived = Article.unarchived
    @articles_archived = Article.archived
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @article] }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @article.user = current_user
    
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [:admin, @article], notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @article] }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.delete
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def unarchieve
    @article.restore
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully unarchieved.' }
      format.json { head :ok }
    end
  end

  def archieve
    @article.delete
    respond_to do |format|
      format.html { redirect_to admin_articles_url, notice: 'Article was successfully archieved.' }
      format.json { head :ok }
    end
  end

  private

  def set_article
    begin
      @article = Article.find(params[:id])
    rescue
      redirect_to admin_articles_path, notice: 'Not Found.'
    end
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
