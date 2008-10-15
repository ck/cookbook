class Recipes < Application
  # provides :xml, :yaml, :js

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
    display Recipe
  end

  def edit(id)
    only_provides :html
    @recipe = Recipe.get(id)
    raise NotFound unless @recipe
    display @recipe
  end

  def create(recipe)
    @recipe = session.user.recipes.build(recipe)
    if @recipe.save
      redirect resource(@recipe), :message => {:notice => "Recipe was successfully created"}
    else
      render :new
    end
  end

  def update(recipe)
    @recipe = session.user.recipes.get(id)
    raise NotFound unless @recipe
    if @recipe.update_attributes(recipe)
       redirect resource(@recipe)
    else
      display @recipe, :edit
    end
  end

  def destroy(id)
    @recipe = session.user.recipes.get(id)
    raise NotFound unless @recipe
    if @recipe.destroy
      redirect resource(@recipes)
    else
      raise InternalServerError
    end
  end

end # Recipes
