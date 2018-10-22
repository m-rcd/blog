class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end 

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(particle_params)
    @article.save #save model in db/ will return boolean to say if saved or not
    redirect_to @article #redirect user to show action
  end

  private
  def particle_params
    params.require(:article).permit(:title, :text)
  end
end

#A frequent practice is to place the standard CRUD actions in each controller
#in the following order: index, show, new, edit, create, update and destroy
