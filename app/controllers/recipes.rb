class Recipes < Application

  # provides :xml, :yaml, :js

  before :ensure_authenticated

  def index
	  @recipes = session.user.recipes
    display @recipes
  end

  def show(id)
	  @recipe = session.user.recipes.get(id)
    raise NotFound unless @recipe
    display @recipe
  end

  def new
    only_provides :html
    @recipe = Recipe.new(:cook => session.user)
    render
  end

  def edit(id)
    only_provides :html
    @recipe = session.user.recipes.get(id)
    raise NotFound unless @recipe
    render
  end

  def create(recipe)
    raise BadRequest, "No params passed to create a new object, check your new action view!" if recipe.nil?
    @recipe = session.user.recipes.build(recipe)
    if @recipe.save
      redirect url(:recipe, @recipe)
    else
      render :new
    end
  end

  def update(id, recipe)
    @recipe = session.user.recipes.get(id)
    raise NotFound unless @recipe
    if @recipe.update_attributes(recipe) || !@recipe.dirty?
      redirect url(:recipe, @recipe)
    else
      raise BadRequest
    end
  end

  def destroy(id)
    @recipe = session.user.recipes.get(id)
    raise NotFound unless @recipe
    if @recipe.destroy
      redirect url(:recipes)
    else
      raise BadRequest
    end
  end

end # Recipes
