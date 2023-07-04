require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get foods_new_url
    assert_response :success
  end

  test "should get create" do
    get foods_create_url
    assert_response :success
  end
end
