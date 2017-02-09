require 'test_helper'
require 'minitest/autorun'

class UserTest < Minitest::Test
  def test_new_user_has_name
    user = User.new(name: 'Bill')
    assert user.name != nil
  end

  def test_new_user_without_name_fails
    user = User.new()
    assert_raises(Exception)
  end
end
