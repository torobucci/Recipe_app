class RecipeFoodsController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.create(food_params)
    @food.user = current_user
    @recipe_food = @recipe.recipe_foods.build(food: @food, quantity: @food.quantity)
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient added successfully created.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :quantity, :measurement_unit)
  end
end
