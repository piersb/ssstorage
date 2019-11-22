require 'test_helper'

class AVFileTest < ActiveSupport::TestCase

  def setup
    @avfile = avfiles(:colossus)
  end

  test "avfile is valid" do
    assert @avfile.valid?
  end




end
