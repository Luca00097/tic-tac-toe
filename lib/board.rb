class Board
  WINNING_LINES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6]             # diagonals
  ]

  def initialize
    @squares = Array.new(9, " ")
  end

  def place_mark(position, mark)
    return false unless valid_move?(position)
    @squares[position] = mark
    true
  end

  def valid_move?(position)
    position.between?(0, 8) && @squares[position] == " "
  end

  def winner?
    WINNING_LINES.any? do |line|
      a, b, c = line.map { |i| @squares[i] }
      a != " " && a == b && b == c
    end
  end

  def full?
    !@squares.include?(" ")
  end

  def display
    puts " #{@squares[0]} | #{@squares[1]} | #{@squares[2]} "
    puts "---+---+---"
    puts " #{@squares[3]} | #{@squares[4]} | #{@squares[5]} "
    puts "---+---+---"
    puts " #{@squares[6]} | #{@squares[7]} | #{@squares[8]} "
  end
end