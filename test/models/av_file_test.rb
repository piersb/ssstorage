require 'test_helper'

class AVFileTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @avfile = AVFile.new(title: "hello", user_id: @user.id)
  end

  test "should be valid" do
    assert @avfile.valid?
  end

  test "user id should be present" do
    @avfile.user_id = nil
    assert_not @avfile.valid?
  end

  test "avfile must have a title" do
    @avfile.title = "     "
    assert_not @avfile.valid?
  end

end
