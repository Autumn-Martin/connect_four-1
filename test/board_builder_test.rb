require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board_builder'

class BoardBuilderTest < Minitest::Test
  def test_it_exists
    bb = BoardBuilder.new

    assert_instance_of BoardBuilder, bb
  end

  def test_it_can_build_a_board
    bb = BoardBuilder.new

    assert_instance_of Board, bb.build
  end

  def test_its_boards_are_well_formed
    skip
  end
end
