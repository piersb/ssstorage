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
    # assert_select 'div#error_explation'
  end

end
