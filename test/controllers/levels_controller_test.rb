require 'test_helper'

class LevelsControllerTest < ActionDispatch::IntegrationTest
  test "should get play" do
    get levels_play_url
    assert_response :success
  end

end
