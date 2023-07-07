class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.includes(:foods).find_by(id: params[:id])
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe successfully deleted.'
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
    params.require(:recipe).permit(:public)
  end
end
