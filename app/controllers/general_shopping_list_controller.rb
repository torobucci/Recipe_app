class GeneralShoppingListController < ApplicationController
  def index
    @recipes = current_user.recipes.includes(:foods)
    @general_food_list = current_user.foods
    @shopping_list = find_missing_food_list
  end

  private

  def find_missing_food_list
    missing_foods = []
    @recipes.each do |recipe|
      recipe.foods.each do |food|
        missing_foods << food unless @general_food_list.include?(food)
      end
    end
    missing_foods
  end
end
