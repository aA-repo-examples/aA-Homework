require 'byebug'
class Array
  #Sluggish Octopus O(n^2)
  def sluggish_o
    biggest_fish = first

    self.each do |fish1|
      self.each do |fish2|
        if fish1.length > fish2.length && fish1.length > biggest_fish.length
          biggest_fish = fish1
        end
      end
    end

    biggest_fish
  end

  # Dominant Octopus O(n log n)
  def merge_sort(&prc)
    prc ||= Proc.new { |fish1, fish2| fish1.length <=> fish2.length}

    return self if length <= 1

    mid = length / 2

    left = self[0...mid].merge_sort(&prc)
    right = self[mid..-1].merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end

    merged + left + right
  end
end

class Array
  #clever octopus O(n)
  def clever
    biggest_fish = first

    self.each do |fish|
      biggest_fish = fish if fish.length > biggest_fish.length
    end

    biggest_fish
  end
end

# O(n)
def slow_dance(direction, array)
  array.each_with_index do |dir, idx|
    return idx if dir == direction
  end
end

# O(1)
def constant_dance(direction, directions_hash)
  directions_hash[direction]
end

if __FILE__ == $PROGRAM_NAME
  fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  fish.clever

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  slow_dance("up", tiles_array)

  directions_hash = { "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

  p constant_dance("right-down", directions_hash)

end
