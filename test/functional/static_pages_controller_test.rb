require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get articles" do
    get :articles
    assert_response :success
  end

  test "should get partners" do
    get :partners
    assert_response :success
  end

  test "should get price" do
    get :price
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
