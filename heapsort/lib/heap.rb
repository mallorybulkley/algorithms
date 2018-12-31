class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc
  end

  def count
    store.length
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    val = @store.pop
    BinaryMinHeap.heapify_down(@store, 0, count, &@prc)
    val
  end

  def peek
    store[0]
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1, count, &@prc)
  end

  public
  def self.child_indices(len, parent_index)
    [parent_index * 2 + 1, parent_index * 2 + 2].select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    children_indices = child_indices(len, parent_idx)
    while !children_indices.empty?
      child_to_swap = nil
      if children_indices.length == 1
        child_to_swap = children_indices[0] 
      else 
        child_to_swap = prc.call(
          array[children_indices[0]], 
          array[children_indices[1]]
          ) < 0 ? children_indices[0] : children_indices[1]
      end
      return array unless prc.call(array[child_to_swap], array[parent_idx]) < 0
      array[child_to_swap], array[parent_idx] = array[parent_idx], array[child_to_swap]
      parent_idx = child_to_swap
      children_indices = child_indices(len, parent_idx)
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if len < 2
    prc ||= Proc.new { |a, b| a <=> b }
    parent_idx = parent_index(child_idx)
    while child_idx > 0 && prc.call(array[child_idx], array[parent_idx]) < 0
      array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
      child_idx = parent_idx
      parent_idx = parent_index(child_idx) if child_idx > 0
    end
    array
  end
end
