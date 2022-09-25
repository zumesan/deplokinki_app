require 'test_helper'

class DeplolistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deplolists_index_url
    assert_response :success
  end

end
