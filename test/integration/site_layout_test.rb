require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user=users(:michael)
  end

  test "layout links" do
    # home, not logged in
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", users_path, false
    assert_select "a[href=?]", logout_path, false
    get contact_path
    assert_select "title", full_title("Contact")

    # user, logged in
    log_in_as(@user)
    get user_path(@user)
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path
    assert_select "a[href=?]", edit_user_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", login_path, false

    # home, logged in
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", users_path
    assert_select "a[href=?]", user_path
    assert_select "a[href=?]", edit_user_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", login_path, false



  end

end
