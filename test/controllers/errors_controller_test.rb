require 'test_helper'

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get errors_Index_url
    assert_response :success
  end

end
