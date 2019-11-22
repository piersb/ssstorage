require 'test_helper'

class AVFileTest < ActiveSupport::TestCase

  def setup
    @avfile = avfiles(:colossus)
  end

  test "avfile should be valid" do
    assert @avfile.valid?
  end

  test "user id should be present" do
    @avfile.user_id = nil
    assert_not @avfile.valid?
  end

  test "avfile should have a name" do
    @avfile.name = "    "
    assert_not @avfile.valid?
  end


end
