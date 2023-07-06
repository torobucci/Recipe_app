class PublicRecipesController < ApplicationController
  def index
<<<<<<< HEAD
    @public_recipes = Recipe.where(public: true)
    @users = User.all
=======
    @public_recipes = Recipe.includes(:user, :foods).where(public: true).order(created_at: :desc)
>>>>>>> dev
  end
end
