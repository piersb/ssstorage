require 'test_helper'

class AVFileTest < ActiveSupport::TestCase

  def setup
    @user = users(:michael)
    title = "Colossus: The Forbin Project"
    @avfile = @user.avfiles.build(title: title, s3reference: title.parameterize)
  end

  test "avfile should be valid" do
    assert @avfile.valid?
  end

  test "user id should be present" do
    @avfile.user_id = nil
    assert_not @avfile.valid?
  end

  test "avfile should have a name" do
    @avfile.title = "    "
    assert_not @avfile.valid?
    @avfile.title = nil
    assert_not @avfile.valid?
  end


end
