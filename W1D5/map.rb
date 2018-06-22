class Map
  def initialize
    @map = []
  end

  def set(key, value)
    @map.each_with_index do |pair, idx|
      if pair.first == key
        @map[idx][1] = value
        return @map
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each do |pair|
      return pair.drop(1) if pair.first == key
    end
    "Not a key"
  end

  def delete(key)
    @map.select! { |pair| pair.first != key }
  end

  def show
    @map
  end
end
