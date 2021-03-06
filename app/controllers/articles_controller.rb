class ArticlesController < ApplicationController
  # layout 'blog'
  skip_before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @girl = Girl.find(params[:girl_id])
    @article = @girl.articles.new(article_params)

    if @article.save
      redirect_to girl_path(@girl), notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @girl = Article.find(params[:girl_id])
    @article = @girl.articles.find(params[:id])
    if @article.delete
    redirect_to articles_url, notice: 'Article was successfully deleted.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:girl, :title, :body, :picture)
    end
end
