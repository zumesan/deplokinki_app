require 'test_helper'

class DeplomiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deplomies_index_url
    assert_response :success
  end

end
