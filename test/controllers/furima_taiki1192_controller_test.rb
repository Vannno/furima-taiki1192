require 'test_helper'

class FurimaTaiki1192ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get furima_taiki1192_index_url
    assert_response :success
  end

end
