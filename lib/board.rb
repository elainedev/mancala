class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){ [] }
    @cups = @cups.each_with_index do |cup, idx|
      4.times { cup << :stone } unless idx == 6 || idx == 13
    end  # difference between << and cup += [:stone]
  end



  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 1 || start_pos > 12
    raise 'Invalid starting cup' if cups[start_pos].empty?

  end

  def make_move(start_pos, current_player_name)

      # @cups[start_pos].length.times do |i|
      #   @cups[(start_pos + 1 + i) % 13] << :stone
      # end

      stones = Array.new(@cups[start_pos].length, :stone)
      @cups[start_pos] = []

      i = 1
      until stones.empty?
        unless (start_pos + i == 6 && current_player_name == @name2) || (start_pos + i == 13 && current_player_name == @name1)
          @cups[(start_pos + i) % 13] << stones.pop
        end
        i += 1
        start_pos += 1
      end
      end_cup_idx = (start_pos) % 13
      if (start_pos + i == 6 && current_player_name == @name2) || (start_pos + i == 13 && current_player_name == @name1)
        end_cup_idx = (start_pos + i + 1) % 13
      end
        next_turn(end_cup_idx)


    render
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :switch if @cups[ending_cup_idx].count == 1

    return :prompt if @cups
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].empty? || cups[7..13].empty?
  end

  def winner
  end

end
