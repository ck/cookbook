class Recipes < Application

  # provides :xml, :yaml, :js

  before :ensure_authenticated

  def index
    @recipes = Recipe.all
    display @recipes
  end

  def show
    @recipe = Recipe.get(params[:id])
    raise NotFound unless @recipe
    display @recipe
  end

  def new
    only_provides :html
    @recipe = Recipe.new
    render
  end

  def edit
    only_provides :html
    @recipe = Recipe.get(params[:id])
    raise NotFound unless @recipe
    render
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect url(:recipe, @recipe)
    else
      render :new
    end
  end

  def update
    @recipe = Recipe.get(params[:id])
    raise NotFound unless @recipe
    if @recipe.update_attributes(params[:recipe]) || !@recipe.dirty?
      redirect url(:recipe, @recipe)
    else
      raise BadRequest
    end
  end

  def destroy
    @recipe = Recipe.get(params[:id])
    raise NotFound unless @recipe
    if @recipe.destroy
      redirect url(:recipe)
    else
      raise BadRequest
    end
  end

end # Recipes
