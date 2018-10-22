class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(particle_params)
    if @article.save
      redirect_to @article #redirect user to show action
    else
      render 'new'
    end
    #@article.save #save model in db/ will return boolean to say if saved or not
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def particle_params
    params.require(:article).permit(:title, :text)
  end
end

#A frequent practice is to place the standard CRUD actions in each controller
#in the following order: index, show, new, edit, create, update and destroy
