require 'test_helper'

class AVFileTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    @avfile = AVFile.new(title: "hello", user_id: @user.id)
  end

  test "should be valid" do
    assert @avfile.valid?
  end

end
