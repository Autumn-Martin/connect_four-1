class Space
  attr_reader :x,
              :y,
              :owner

  def initialize(x, y)
    @x = x
    @y = y
    @owner = nil
  end

  def sum_of_coordinates
    x + y
  end

  def difference_of_coordinates
    x - y
  end

  def empty?
    @owner.nil?
  end

  def set_owner(owner)
    @owner = owner
  end

  def symbol
    case @owner
    when nil
      "."
    when 1
      "X"
    when 2
      "O"
    end
  end
end
