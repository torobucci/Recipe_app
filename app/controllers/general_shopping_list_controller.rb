class GeneralShoppingListController < ApplicationController
  def index
    @recipe = Recipe.includes(recipe_foods: :food).find(params[:recipe_id])

    @shopping_list = @recipe.shopping_list(current_user)
  end
end
