require 'test_helper'

class AppPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get checklist" do
    get :checklist
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
