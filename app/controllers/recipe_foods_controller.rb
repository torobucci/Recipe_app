class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = current_user.foods
    @recipe_food = @recipe.recipe_foods.build
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    if already_included?(@recipe_food.food_id)
      redirect_to recipe_path(@recipe), alert: 'Ingredient is already included in the recipe.'
    elsif @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient added successfully.'
    else
      render :new
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.destroy
      redirect_to recipe_path(id: params[:recipe_id]), notice: 'Recipe Food successfully deleted.'
    else
      redirect_to recipe_path(id: params[:recipe_id]), alert: 'Failed to delete recipe food.'
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end

  def already_included?(food_id)
    @recipe.recipe_foods.exists?(food_id:)
  end
end
