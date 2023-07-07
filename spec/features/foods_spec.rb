require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  let!(:user) { User.create!(name: 'Lanzz', email: 'lanzz2@gmail.com', password: '123456') }
  let(:food1) do
    Food.create!(
      name: 'rice',
      measurement_unit: 'kg',
      price: 60,
      quantity: 'A delicious rice food',
      user_id: user.id
    )
  end
  let(:food2) do
    Food.create!(
      name: 'rice',
      measurement_unit: 'kg',
      price: 60,
      quantity: 'A delicious rice food',
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
    it 'displays a list of foods' do
      visit foods_path

      expect(page).to have_content('Food')
      expect(page).to have_content(food1.name)
      expect(page).to have_content(food2.name)
    end
  end
end
