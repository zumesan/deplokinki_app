require 'test_helper'

class DeploshigasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deploshigas_index_url
    assert_response :success
  end

end
