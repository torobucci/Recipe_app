require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:recipe_food) { RecipeFood.new(recipe_id: 1, food_id: 1) }

  describe 'validations' do
    it 'validates the presence of quantity' do
      expect(recipe_food).not_to be_valid
    end
  end
end
