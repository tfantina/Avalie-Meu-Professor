require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    request.base_url
    assert_response :success
  end
end
