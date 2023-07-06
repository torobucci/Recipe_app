class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @foods = @recipe.foods
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe successfully deleted.'
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    render json: { success: true }
  end

  private

  def recipe_params
    params.require(:recipe).permit(:public)
  end
end
