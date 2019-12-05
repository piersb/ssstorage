require 'test_helper'

class AVFilesInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "avfiles interface" do
    log_in_as(@user)
    get root_path
    assert_select 'h3', 'My uploads'
    # invalid submission
    assert_no_difference 'AVFile.count' do
      post avfiles_path, params: { avfile: {title: ''}}
    end
    assert_select 'div#error_explanation'
    # valid submission
    title = "Oompa Loompa Marching Band"
    assert_difference 'AVFile.count', 1 do
      post avfiles_path params: {avfile:{title: title, file: '/path/to/file.mp4'}}
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match title, response.body
  end

end
