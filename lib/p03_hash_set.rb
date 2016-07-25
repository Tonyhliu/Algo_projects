require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if self.include?(key)
    self[key.hash] << key
    @count += 1
    resize! if num_buckets < @count

    key
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return nil unless self.include?(key)
    self[key.hash].delete(key)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0 # reset count

    old.each do |bucket|
      bucket.each do |num|
        self.insert(num)
      end
    end
  end
end
