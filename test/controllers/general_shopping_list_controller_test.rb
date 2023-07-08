require 'test_helper'

class GeneralShoppingListControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get general_shopping_list_index_url
    assert_response :success
  end
end
