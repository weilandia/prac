require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "root should get home" do
    get root_path
    assert_response :success
    assert_select "title", "rails 5 playground | home"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "rails 5 playground | home"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "rails 5 playground | help"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "rails 5 playground | about"
  end
end
