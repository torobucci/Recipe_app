class GeneralShoppingListController < ApplicationController
  def index
    @users = User.all.includes(:foods)
    @foods = Food.where.not(user_id: current_user.id).includes(:user)
  end
end
