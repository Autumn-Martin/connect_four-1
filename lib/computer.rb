class Computer
  def initialize(order, board)
    @order = order
    @board = board
  end

  def take_turn
    columns = ["A", "B", "C", "D", "E", "F", "G"]
    @board.place(@order, columns.sample)
  end

end
