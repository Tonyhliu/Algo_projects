require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(5)
    self.capacity = 5
    self.start_idx = 0
    self.length = 0
  end

  # O(1)
  def [](index)
  end

  # O(1)
  def []=(index, val)
  end

  # O(1)
  def pop
  end

  # O(1) ammortized
  def push(val)
  end

  # O(1)
  def shift
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless index >= 0 && index < length
  end

  def resize!
  end
end
