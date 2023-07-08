class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.includes(:foods, :recipe_foods).find_by(id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe successfully deleted.'
    else
      redirect_to recipes_path, alert: 'Failed to delete recipe.'
    end
  end

  def toggle_public
    recipe = Recipe.find(params[:id])
    recipe.update(public: params[:public])

    if recipe.save
      head :ok
    else
      head :bad_request
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
