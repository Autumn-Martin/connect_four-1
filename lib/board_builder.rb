require './lib/space'
require './lib/board'

module BoardBuilder

  def self.build
    spaces = create_spaces
    Board.new(spaces)
  end

  def self.create_spaces
    spaces = []
    6.times do |y|
      spaces.push create_row(y)
    end
    spaces.flatten
  end

  def self.create_row(y)
    row = []
    7.times do |x|
      row.push Space.new(x, y)
    end
    row
  end

end
