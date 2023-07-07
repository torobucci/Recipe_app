class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = current_user.foods.includes(:user)
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      @food = @food.includes(:user)
      redirect_to foods_path, notice: 'Food successfully created.'
    else
      render :new
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :price, :quantity, :measurement_unit)
  end
end
