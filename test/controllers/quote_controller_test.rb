require 'test_helper'

class QuoteControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get quote_Index_url
    assert_response :success
  end

end
