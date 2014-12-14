require 'test_helper'

class StaticpagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get abouttheclub" do
    get :abouttheclub
    assert_response :success
  end

  test "should get howtojoin" do
    get :howtojoin
    assert_response :success
  end

  test "should get whatyouneed" do
    get :whatyouneed
    assert_response :success
  end

  test "should get clubmatters" do
    get :clubmatters
    assert_response :success
  end

  test "should get howtogetthere" do
    get :howtogetthere
    assert_response :success
  end

  test "should get croquetlinks" do
    get :croquetlinks
    assert_response :success
  end

end
