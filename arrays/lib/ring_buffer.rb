require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    adjusted_idx = adjusted_index(index)
    store[adjusted_idx]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    adjusted_idx = adjusted_index(index)
    store[adjusted_idx] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if length == 0
    new_length = length - 1
    @length = new_length
    last_idx = adjusted_index(new_length)
    store[last_idx]
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    last_idx = adjusted_index(length)
    @length += 1
    store[last_idx] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if length == 0
    el = store[start_idx]
    @start_idx = adjusted_index(1)
    @length -= 1
    el
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    if @start_idx == 0
      @start_idx = capacity - 1
    else
      @start_idx -= 1
    end
    @length += 1
    store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if index >= length
  end

  def adjusted_index(index)
    (start_idx + index) % capacity
  end

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    length.times do |idx|
      adjusted_index = adjusted_index(idx)
      new_store[idx] = store[adjusted_index]
    end
    @start_idx = 0
    @capacity = new_capacity
    @store = new_store
  end
end
