class GeneralShoppingListController < ApplicationController
  def index
    @users = User.includes(:foods)
    @foods = Food.where.not(user_id: current_user.id).includes(:user)
  end
end
