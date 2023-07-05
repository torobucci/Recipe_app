class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food successfully created.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.user_id == current_user.id
      @food.destroy
      redirect_to foods_path, notice: 'Food item was successfully deleted.'
    else
      redirect_to foods_path, alert: 'You are not authorized to delete this food item.'
    end
  end


  private

  def food_params
    params.require(:food).permit(:name, :price, :quantity, :measurement_unit)
  end
end
