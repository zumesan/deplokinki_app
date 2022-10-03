require 'test_helper'

class DeplonarasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deplonaras_index_url
    assert_response :success
  end

end
