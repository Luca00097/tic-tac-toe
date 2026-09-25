require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
    @current_player = @player1
  end

  def play
    loop do
      @board.display
      position = get_valid_move
      @board.place_mark(position, @current_player.mark)

      if @board.winner?
        @board.display
        puts "#{@current_player.name} wins!"
        break
      elsif @board.full?
        @board.display
        puts "It's a draw!"
        break
      end

      switch_player
    end
  end

  private

  def get_valid_move
    loop do
      puts "#{@current_player.name} (#{@current_player.mark}), choose a square (1-9):"
      input = gets.chomp.to_i - 1
      return input if @board.valid_move?(input)
      puts "Invalid move, try again."
    end
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end