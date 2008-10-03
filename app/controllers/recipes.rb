class Recipes < Application

  # provides :xml, :yaml, :js

  before :ensure_authenticated

  def index
    @recipes = session.user.recipes
    display @recipes
  end

  def show
    @recipe = session.user.recipes.get(params[:id])
    raise NotFound unless @recipe
    display @recipe
  end

  def new
    only_provides :html
    @recipe = Recipe.new
    @recipe.cook = session.user
    render
  end

  def edit
    only_provides :html
    @recipe = session.user.recipes.get(params[:id])
    raise NotFound unless @recipe
    render
  end

  def create
    @recipe = session.user.recipes.build(params[:recipe])
    if @recipe.save
      redirect url(:recipe, @recipe)
    else
      render :new
    end
  end

  def update
    @recipe = session.user.recipes.get(params[:id])
    raise NotFound unless @recipe
    if @recipe.update_attributes(params[:recipe]) || !@recipe.dirty?
      redirect url(:recipe, @recipe)
    else
      raise BadRequest
    end
  end

  def destroy
    @recipe = session.user.recipes.get(params[:id])
    raise NotFound unless @recipe
    if @recipe.destroy
      redirect url(:recipe)
    else
      raise BadRequest
    end
  end
  
end # Recipes
