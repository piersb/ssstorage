require 'test_helper'
class UsersSignupTest < ActionDispatch::IntegrationTest

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

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
            password: "hellothere", password_confirmation: "hellothere")
  end

  # test "valid user" do
  #   get signup_path
  #   post users_path params: {user: @user.attributes }
  #   assert_select 'div#error_explanation', false
  #   assert_select 'div.field_with_errors', false
  # end


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


end
