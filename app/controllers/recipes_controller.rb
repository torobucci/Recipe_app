class RecipesController < ApplicationController
  # load_and_authorize_resource

  def index
    @recipes = Recipe.all
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
end
