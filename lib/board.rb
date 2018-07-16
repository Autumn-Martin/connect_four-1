class Board
  attr_reader :spaces

  def initialize(spaces)
    @spaces = spaces
    @winner = nil
  end

  def place(player, column_letter)
    column = column_to_index[column_letter.upcase]
    sorted_column = columns[column].sort_by do |space|
      0 - space.y
    end
    empty_space = sorted_column.find do |space|
      space.empty?
    end

    empty_space.set_owner(player)
  end

  def column_to_index
    {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6,
    }
  end

  def with_headers
    "ABCDEFG\n" + formatted_rows
  end

  def formatted_rows
    rows.map do |row|
      row.map do |space|
        space.symbol
      end.join
    end.join("\n")
  end

  def result
    if draw
      "It was a draw!"
    else
      "Player #{@winner} won!"
    end
  end

  def rows
    sorted_rows = []
    @spaces.each do |space|
      if sorted_rows[space.y] == nil
        sorted_rows[space.y] = [space]
      else
        sorted_rows[space.y] << space
      end
    end
    sorted_rows
  end

  def columns
    sorted_columns = []
    @spaces.each do |space|
      if sorted_columns[space.x] == nil
        sorted_columns[space.x] = [space]
      else
        sorted_columns[space.x] << space
      end
    end
    sorted_columns
  end

  def northeast_diagonals
    sorted_diagonals = []
    sorted_spaces = @spaces.sort_by do |space|
      space.sum_of_coordinates
    end
    sorted_spaces.each do |space|
      if sorted_diagonals.last == nil
        sorted_diagonals << [space]
      elsif sorted_diagonals.last.last.sum_of_coordinates == space.sum_of_coordinates
        sorted_diagonals.last << space
      else
        sorted_diagonals << [space]
      end
    end
    sorted_diagonals.each do |diagonal|
      diagonal.sort_by! do |space|
        space.x
      end
    end
    sorted_diagonals
  end

  def southeast_diagonals
    sorted_diagonals = []
    sorted_spaces = @spaces.sort_by do |space|
      space.difference_of_coordinates
    end
    sorted_spaces.each do |space|
      if sorted_diagonals.last == nil
        sorted_diagonals << [space]
      elsif sorted_diagonals.last.last.difference_of_coordinates == space.difference_of_coordinates
        sorted_diagonals.last << space
      else
        sorted_diagonals << [space]
      end
    end
    sorted_diagonals.each do |diagonal|
      diagonal.sort_by! do |space|
        space.x
      end
    end
    sorted_diagonals
  end

  def game_over?
    a = check_horizontal
    b = check_vertical
    c = check_northeast
    d = check_southeast
    return true if a || b || c || d || draw
  end

  def draw
    rows.first.all? do |space|
      space.owner != nil
    end
  end

  def check_horizontal
    check_arrays(rows)
  end

  def check_vertical
    check_arrays(columns)
  end

  def check_northeast
    check_arrays(northeast_diagonals)
  end

  def check_southeast
    check_arrays(southeast_diagonals)
  end

  def check_arrays(arrays)
    candidates = arrays.map do |row|
      check_for_four(row)
    end
    candidates.any? do |candidate|
      candidate == true
    end
  end

  def check_for_four(row)
    win = false
    consecutive = 0
    last_owner  = nil
    row.each do |space|
      if space.owner == nil
        consecutive = 0
      elsif space.owner == last_owner
        consecutive += 1
      else
        consecutive = 0
        last_owner = space.owner
      end
      if consecutive >= 3
        win = true
        @winner = last_owner
      end
    end

    return win
  end
end
