require 'test_helper'

class UserShowTest < ActionDispatch::IntegrationTest

  def setup
    @non_activated = users(:lana)
  end

  test "do not show user page if user not active" do
    get user_path(@non_activated)
    assert_redirected_to root_url
  end


end
