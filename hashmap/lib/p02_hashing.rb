class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    all_hash = 0
    each_with_index do |el, i|
      all_hash += (el * i).hash
    end
    all_hash.hash
  end
end

class String
  def hash
    all_hash = 0
    each_char.with_index do |char, i|
      all_hash += (char.ord * i).hash
    end
    all_hash.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    all_hash = 0
    each do |key, val|
      all_hash += (key.to_s + val.to_s).hash
    end
    all_hash.hash
  end
end
