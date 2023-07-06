require 'rails_helper'

RSpec.describe 'Recipes', type: :feature do
  let!(:user) { User.create!(name: 'John Doe', email: 'doe1@gmail.com', password: '123456') }
  let!(:recipe1) do
    Recipe.create!(
      name: 'Chocolate Cake',
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious chocolate cake recipe',
      public: true,
      user_id: user.id
    )
  end
  let!(:recipe2) do
    Recipe.create!(
      name: 'Chocolate Cake2',
      preparation_time: 30,
      cooking_time: 60,
      description: 'A delicious chocolate cake recipe',
      public: true,
      user_id: user.id
    )
  end

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
  describe 'Index page' do
    it 'displays a list of recipes' do
      visit recipes_path

      expect(page).to have_content('Recipes')
      expect(page).to have_content(recipe1.name)
      expect(page).to have_content(recipe2.name)
    end
  end

  describe 'Show page' do
    it 'displays the details of a recipe' do
      visit recipe_path(recipe1)

      expect(page).to have_content(recipe1.name)
      expect(page).to have_content("Preparation Time: #{recipe1.preparation_time} hours")
      expect(page).to have_content("Cooking Time: #{recipe1.cooking_time} hours")
    end
  end
end
