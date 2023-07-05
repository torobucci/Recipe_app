class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true)
    @users = User.all
  end
end
