require 'test_helper'

class ChatControllerTest < ActionController::TestCase
  test "should get message" do
    get :message
    assert_response :success
  end

end
