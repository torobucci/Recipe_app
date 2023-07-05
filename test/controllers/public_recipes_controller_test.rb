require 'test_helper'

class PublicRecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_recipes_index_url
    assert_response :success
  end
end
