require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get quiz_show_url
    assert_response :success
  end

end
