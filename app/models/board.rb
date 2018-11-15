# Defines the Board where the Robot walks
class Board
  def initialize(attr = {})
    initialized_squares = initialize_squares(attr[:squares])
    @squares = Matrix[*initialized_squares]
    @oob = Square.oob
  end

  def initialize_squares(squares)
    squares&.map do |row|
      row&.map do |square|
        Square.new(square.to_sym)
      end
    end
  end

  def square_at(position)
    row = position[1] - 1
    column = position[0] - 1
    @squares[row, column] || @oob
  end

  def to_s
    print_with_robot_at(nil)
  end

  def print_with_robot_at(position = nil, character = 'R ')
    matrix = position ? matrix_with_robot(position, character) : @squares
    "\n" + matrix.to_a.map(&:join).join("\n")
  end

  private

  def matrix_with_robot(position, character)
    matrix = @squares.map(&:dup)
    matrix.send(:[]=, *position.map(&:pred).reverse, character)
    matrix
  end
end
