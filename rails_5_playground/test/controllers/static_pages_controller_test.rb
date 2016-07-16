require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "rails 5 playground | home"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "rails 5 playground | help"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "rails 5 playground | about"
  end
end
