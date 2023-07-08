require 'rails_helper'

RSpec.describe 'foods', type: :request do
  let(:user) { User.create!(name: 'Lanzz', email: 'lanzz3@gmail.com', password: '123456') }

  before do
    sign_in user
  end

  describe 'GET /foods' do
    it 'returns a successful response' do
      get foods_path
      expect(response).to have_http_status(:ok)
    end
  end
end
