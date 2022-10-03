require 'test_helper'

class DeplowakayamasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deplowakayamas_index_url
    assert_response :success
  end

end
