require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    until game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    p seq
    puts "press enter"
    gets
  end

  def require_sequence
    system('clear')
    puts "Enter the sequence of colors (one at a time)"
    guess = []
    until guess.length == seq.length || game_over
      puts "Color? ( red blue green yellow )"
      guess << gets.chomp
      # byebug
      unless seq[0...guess.length] == guess[0...guess.length]
        @game_over = true
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good job!"
  end

  def game_over_message
    puts "GAME OVER"
    puts "You completed #{sequence_length - 1} rounds!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $0
  game = Simon.new
  game.play
end
