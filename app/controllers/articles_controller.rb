class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "sona", password: "sona", except: [:index, :show]
  def index
    @articles = Article.all
    respond_to do |format|
      format.html
      format.json {render json: @articles}
    end
  end
  def new
  @article = Article.new
  respond_to do |format|
      format.html
      format.json {render json: @article}
    end
end
 
 def edit
  @article = Article.find(params[:id])
  respond_to do |format|
      format.html { redirect_to @article}
      format.json {render json: @article}
    end
end

def create
  @article = Article.new(article_params)
 
  if @article.save
    respond_to do |format|
      format.html { redirect_to @article}
      format.json {render json: @article}
    end
  else
    render 'new'
  end
end
def destroy
  @article = Article.find(params[:id])
  respond_to do |format|
      format.html { redirect_to @article}
      format.json {render json: @article}
    end
 
  #redirect_to articles_path
end
  def update
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
      respond_to do |format|
      format.html { redirect_to @article}
      format.json {render json: @article}
    end
	  else
	    render 'edit'
  	  end
  end
  def show
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @article}
    end
  end
 
private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
