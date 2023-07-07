require 'rails_helper'

RSpec.describe 'foods', type: :request do
 user = User.create!(name: 'Lanzz', email: 'lanzz@gmail.com', password: '123456')
  describe 'GET /foods' do
    it 'returns a successful response' do
      get foods_path
      expect(response).to have_http_status(:found)
    end
  end

  describe 'GET /foods/:id' do
    let(:food) do
      Food.create!(
        name: 'rice',
        measurement_unit: "kg",
        price: 60,
        quantity: 'A delicious rice recipe',
        user_id: user.id
      )
    end
    it 'returns a successful response' do
      get recipe_path(food)
      expect(response).to have_http_status(:found)
    end
  end
end
