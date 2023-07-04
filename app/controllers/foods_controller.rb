class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = 1
    if @food.save
      redirect_to foods_path, notice: "Food successfully created."
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price,:quantity,:measurement_unit)
  end
end
