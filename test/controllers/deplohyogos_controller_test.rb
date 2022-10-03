require 'test_helper'

class DeplohyogosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deplohyogos_index_url
    assert_response :success
  end

end
