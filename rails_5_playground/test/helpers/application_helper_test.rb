require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "rails 5 playground"
    assert_equal full_title("help"), "rails 5 playground | help"
  end
end
