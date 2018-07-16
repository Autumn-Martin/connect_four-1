require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/space.rb'

class SpaceTest < Minitest::Test
  def test_it_exists
    space = Space.new(0, 0)

    assert_instance_of Space, space
  end

  def test_it_has_coordinates
    space = Space.new(1, 5)

    assert_equal 1, space.x
    assert_equal 5, space.y
  end
end
