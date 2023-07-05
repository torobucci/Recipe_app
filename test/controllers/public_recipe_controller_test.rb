require 'test_helper'

class PublicRecipeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get public_recipe_index_url
    assert_response :success
  end
end
