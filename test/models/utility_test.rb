require 'test_helper'
require 'minitest/autorun'

class UtilityTest < Minitest::Test

  def test_format_date_handles_date
    date = Time.current
    assert Utility.format_date(date) == date.to_s(:short)
  end

  def test_format_date_handles_string
    date = Time.current
    date_string = date.to_s
    assert Utility.format_date(date_string) == date.to_s(:short)
  end
end
