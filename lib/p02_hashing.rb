class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.each_with_index.inject(0) do |intermediate, (el, idx)|
      (el.hash + idx.hash) ^ intermediate
    end
  end
end

class String
  def hash
    hashed = self.chars.map do |letter|
      letter.ord
    end
    hashed.hash
  end
end

class Hash
  def hash
    hash_result = self.to_a.sort_by(&:hash)
    hash_result.hash
  end
end
