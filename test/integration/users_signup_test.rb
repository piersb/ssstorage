require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest


  def setup
    @user = User.new(name: "Example User",
                     email: "user@example.com",
                     password: "password",
                     password_confirmation: "password")
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name: "",
                                          email: "user@invalid",
                                          password: "this",
                                          password_confirmation: "that" } }
    end
    assert_template 'users/new'
  end

  test "invalid user name" do
    get signup_path
    @user.name = ""
    post users_path params: {user: @user.attributes }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "invalid user email" do
    get signup_path
    @user.email = "test@example"
    post users_path params: {user: @user.attributes }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "invalid password_confirmation" do
    get signup_path
    @user.password = "hello"
    post users_path params: {user: @user.attributes }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "passwords don't match" do
    get signup_path
    @user.password = "this"
    @user.password_confirmation = "that"
    post users_path params: {user: @user.attributes }
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "posting to wrong url" do
    get signup_path
    assert_select 'form[action="/signup"]'
    post users_path params: {user: @user.attributes}
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                         email: "user@example.com",
                                         password: "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end




end
