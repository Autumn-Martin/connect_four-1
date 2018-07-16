require './lib/board_builder'
require './lib/player'
require './lib/computer'

class Game
  def play
    setup_pieces
    take_turns
  end

  def setup_pieces
    @board   = BoardBuilder.build
    @player1 = Player.new(1, @board)
    @player2 = Computer.new(2, @board)
  end

  def take_turns
    while true
      @player1.take_turn
      puts @board.with_headers
      break if @board.game_over?
      @player2.take_turn
      puts @board.with_headers
      break if @board.game_over?
    end
    cleanup
  end

  def cleanup
    print_result(@board)
    ask_about_another_play
  end

  def print_result(board)
    puts @board.result
  end

  def ask_about_another_play
    puts "Would you like to play again?"
    answer = gets.chomp.upcase[0]
    if answer == "Y"
      play
    else
      puts "Thanks for playing!"
    end
  end
end
