class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.includes(:user, :foods).where(public: true).order(created_at: :desc)
  end
end
