require "test/unit"
require 'test_helper'

class MonthTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_month
    month = Month.new("Januar", 1, "jan")
    assert_equal("Januar", month.name)
  end

  def test_find
    month = Month.find "März"
    assert_equal("März", month.name)
   end
end