class Player
  def initialize(order, board)
    @order = order
    @board = board
  end

  def take_turn
    column = get_column
    @board.place(@order, column)
  end

  def get_column
    puts "Where would you like to place your piece (A-G)?"
    gets.chomp
  end
end
