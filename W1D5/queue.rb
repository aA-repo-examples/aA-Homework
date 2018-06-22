class Queue
  def initialize
    @que = []
  end

  def enqueue(el)
    @que << el
  end

  def dequeue
    @que.shift
  end

  def peek
    @que.first
  end
end
