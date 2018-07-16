require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board_builder'
require './lib/board'

class BoardTest < Minitest::Test
  def test_it_exists
    board = BoardBuilder.build

    assert_instance_of Board, board
  end

  def test_it_has_spaces
    board = BoardBuilder.build

    assert_instance_of Space, board.spaces.first
  end

  def test_it_can_organize_spaces_by_rows
    board = BoardBuilder.build

    rows = board.rows
    assert_equal 6, rows.count
    assert_equal 7, rows.first.count
  end

  def test_it_can_organize_spaces_by_columns
    board = BoardBuilder.build

    columns = board.columns
    assert_equal 7, columns.count
    assert_equal 6, columns.first.count
  end

  def test_it_can_organize_spaces_by_northeast_diagonals
    board = BoardBuilder.build

    diagonals = board.northeast_diagonals
    assert_equal 12, diagonals.count
    assert_equal 1, diagonals.first.count
  end

  def test_it_can_organize_spaces_by_southeast_diagonals
    board = BoardBuilder.build

    diagonals = board.southeast_diagonals
    assert_equal 12, diagonals.count
    assert_equal 1, diagonals.first.count
  end

  def test_it_can_place_a_piece
    board = BoardBuilder.build

    board.place(1, "A")

    expected_owner = 1
    actual_owner   = board.rows[5][0].owner

    assert_equal expected_owner, actual_owner
  end

  def test_it_can_place_piece_elsewhere
    board = BoardBuilder.build

    board.place(1, "D")

    expected_owner = 1
    actual_owner   = board.rows[5][3].owner

    assert_equal expected_owner, actual_owner
  end

  def test_it_can_place_a_second_piece
    board = BoardBuilder.build

    board.place(1, "D")
    board.place(1, "D")

    expected_owner = 1
    actual_owner   = board.rows[4][3].owner

    assert_equal expected_owner, actual_owner
  end

end
