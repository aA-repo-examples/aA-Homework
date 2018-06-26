require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos >= @cups.length
    raise "Starting cup is empty" if @cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)
    stone_count = @cups[start_pos].count
    @cups[start_pos] = []
    pos = start_pos
    until stone_count == 0
      pos += 1
      if pos % 14 == 6 && current_player_name == @player2
        next
      elsif pos % 14 == 13 && current_player_name == @player1
        next
      else
        @cups[pos % 14] << :stone
        stone_count -= 1
      end
    end
    render
    next_turn(pos % 14, current_player_name)
  end

  def next_turn(ending_idx, name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_idx].count == 1 && ending_idx != 6 && ending_idx != 13
      return :switch
    elsif ending_idx == 6 && @player1 == name
      return :prompt
    elsif ending_idx == 13 && @player2 == name
      return :prompt
    else
      return ending_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.empty?}
    return true if @cups[7..12].all? {|cup| cup.empty?}
    false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      return :draw
    when 1
      return @player1
    when -1
      return @player2
    end
  end
end
