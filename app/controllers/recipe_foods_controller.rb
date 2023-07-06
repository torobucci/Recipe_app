class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:id])
    @food = Food.new
  end

  def create
    @recipe = Recipe.find(params[:id])
    @food = recipe.foods.build(food_params)
    if @food.save
      redirect_to recipe_path(@recipe), notice: 'Food successfully created.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :quantity, :measurement_unit)
  end
end
