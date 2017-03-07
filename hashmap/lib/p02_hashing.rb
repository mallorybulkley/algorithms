class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashed = 0
    i = 0
    self.each do |el|
      hashed = hashed ^ (el * i)
      i += 1
    end

    hashed.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.keys.sort.join(&:to_s).hash + self.values.sort.join(&:to_s).hash
  end
end
