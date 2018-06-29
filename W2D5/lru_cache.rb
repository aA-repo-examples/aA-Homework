class LRUCache
  def initialize(size)
    @cache = []
    @size = size
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    end
    @cache.push(el)
    @cache.shift if @cache.length > @size
  end

  def show
    show_cache = []
    @cache.each do |el|
      show_cache << el.dup
    end
    show_cache
  end

  private

end
