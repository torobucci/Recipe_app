require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { User.create!(name: 'John Doe', email: 'doe@gmail.com', password: '123456') }
  describe 'GET /recipes' do
    it 'returns a successful response' do
      get recipes_path
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /recipes/:id' do
    let(:recipe) do
      Recipe.create!(
        name: 'Chocolate Cake',
        preparation_time: 30,
        cooking_time: 60,
        description: 'A delicious chocolate cake recipe',
        public: true,
        user_id: user.id
      )
    end
    it 'returns a successful response' do
      get recipe_path(recipe)
      expect(response).to have_http_status(:found)
    end
  end

  describe 'DELETE /recipes/:id' do
    let(:recipe) do
      Recipe.create!(
        name: 'Chocolate Cake',
        preparation_time: 30,
        cooking_time: 60,
        description: 'A delicious chocolate cake recipe',
        public: true,
        user_id: user.id
      )
    end
    it 'deletes the recipe' do
      expect do
        delete recipe_path(recipe)
      end.to change(Recipe, :count).by(1)
    end
  end
end
