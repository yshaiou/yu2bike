require 'test_helper'

class OmniauthControllerTest < ActionController::TestCase
  test "should get callsback" do
    get :callsback
    assert_response :success
  end

end
