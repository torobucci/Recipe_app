require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  let(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password') }
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
  let(:food_params) { { name: 'Flour', price: 5, quantity: 2, measurement_unit: 'cups' } }

  before do
    sign_in user
  end

  describe 'GET /recipe_foods/new' do
    it 'renders the new template' do
      get new_recipe_recipe_food_path(recipe)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /recipe_foods' do
    it 'creates a new recipe food' do
      expect do
        post recipe_recipe_foods_path(recipe), params: { food: food_params }
      end.to change(RecipeFood, :count).by(1)

      expect(response).to redirect_to(recipe_path(recipe))
      expect(flash[:notice]).to eq('Ingredient added successfully created.')
    end

    it 'redirects to new if the creation fails' do
      post recipe_recipe_foods_path(recipe), params: { food: { name: '' } }
      expect(response).to render_template(:new)
    end
  end
end
