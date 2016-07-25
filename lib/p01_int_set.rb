class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    return false if @store[num]
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    return nil unless @store[num]
    @store[num] = false
    num
  end

  def include?(num)
    validate!(num)
    return false unless @store[num]
    true
  end

  private

  def is_valid?(num)
    return true if num.between?(0, @store.length - 1)
    false
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  # each "bucket" is now an array

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    # return false if self[num].include?(num)
    self[num] << num

    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # to look up a number in set, mod num by set's length
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if self[num].include?(num)
    self[num] << num
    @count += 1
    resize! if num_buckets < @count

    num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    # aka CAPACITY
    @store.length
  end

  def resize!
    old = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0 # reset count

    # old.each do |bucket|
    #   bucket.each do |num|
    #     @store.insert(num)
    #   end
    # end

    old.flatten.each { |key| self.insert(key) }
  end
end
