require 'test_helper'

class DeploosakasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deploosakas_index_url
    assert_response :success
  end

end
