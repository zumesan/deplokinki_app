require 'test_helper'

class DeplokyotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deplokyotos_index_url
    assert_response :success
  end

end
