require 'test_helper'

class LicenseControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get ogl" do
    get :ogl
    assert_response :success
  end

  test "should get gpl" do
    get :gpl
    assert_response :success
  end

end
