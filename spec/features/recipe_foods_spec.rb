require 'rails_helper'

RSpec.feature 'Adding Food to Recipe', type: :feature do
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

  scenario 'User adds food to a recipe' do
    # Login as a user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    # Visit the recipe's page
    visit recipe_path(recipe)

    # Click the "Add ingredient" button
    click_link 'Add ingredient'

    # Fill in the food form
    fill_in 'Name', with: 'Flour'
    fill_in 'Measurement unit', with: 'cups'
    fill_in 'Price', with: 5
    fill_in 'Quantity', with: 2

    # Submit the form
    click_button 'Create Food'

    # Expectations
    expect(page).to have_content('Ingredient added successfully created.')
    expect(page).to have_content('Flour')
    expect(page).to have_content('5')
    expect(page).to have_content('2')
  end
end
