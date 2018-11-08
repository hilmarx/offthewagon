require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get teacher_profile_url
    assert_response :success
  end

end
