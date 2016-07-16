require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should be valid" do
    user = User.new(name: "User", email: "user@example.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "should be invalid without name" do
    user = User.new(name: "", email: "user@example.com", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "should be invalid without email" do
    user = User.new(name: "User", email: "", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "should be invalid with invalid email" do
    user_one = User.new(name: "User", email: "email", password: "password", password_confirmation: "password")
    user_two = User.new(name: "User", email: "email.com", password: "password", password_confirmation: "password")
    user_three = User.new(name: "User", email: "email@dskl", password: "password", password_confirmation: "password")

    assert_not user_one.valid?
    assert_not user_two.valid?
    assert_not user_three.valid?
  end
end
