require 'test_helper'

class PlaySessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get play_session_new_url
    assert_response :success
  end

  test "should get create" do
    get play_session_create_url
    assert_response :success
  end

end
