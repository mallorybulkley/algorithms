require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(4)
    @length = 0
    @capacity = 4
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= length
    @store[index] = value
  end

  # O(1)
  def pop
    popped = @store[length - 1]
    @store[length - 1] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length >= capacity
    @store[length]
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
