class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  def initialize
    @head, @tail = Link.new, Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if self.empty?
      return nil
    else
      @head.next
    end
  end

  def last
    if self.empty?
      return nil
    else
      @tail.prev
    end
  end

  def empty?
    @head == @tail
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end

    nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end

    false
  end

  def insert(key, val)
    self.each do |link|
      return link.val = val if link.key == key
    end

    new_link = Link.new(key, val)

    @tail.prev.next = new_link
    new_link.prev = @tail.prev
    new_link.next = @tail
    @tail.prev = new_link

    new_link
  end

  def remove(key)
    self.each do |link|
      if link.key == key
        link.prev.next = link.next
        link.next.prev = link.prev
        link.next = nil
        link.prev = nil
        return link.val
      end
    end

    nil
  end

  def each
    current_link = @head.next
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
