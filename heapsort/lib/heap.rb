require 'byebug'
class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    store.count
  end

  def extract
    store[0], store[count - 1] = store[count - 1], store[0]
    extracted = store.pop
    BinaryMinHeap.heapify_down(store, 0, &prc)
    extracted
  end

  def peek
    store[0]
  end

  def push(val)
    store.push(val)
    BinaryMinHeap.heapify_up(store, count - 1, &prc)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    children = [2 * parent_index + 1, 2 * parent_index + 2]
    children.select { |i| i < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    parent = array[parent_idx]

    left_child_idx, right_child_idx = child_indices(len, parent_idx)
    children = []
    children << array[left_child_idx] if left_child_idx
    children << array[right_child_idx] if right_child_idx

    if children.all? { |child| prc.call(parent, child) <= 0 }
      return array
    end

    smaller_child_idx = nil
    if children.length == 1
      smaller_child_idx = left_child_idx
    else
      smaller_child_idx =
        prc.call(children[0], children[1]) == -1 ? left_child_idx : right_child_idx
    end

    array[parent_idx], array[smaller_child_idx] = array[smaller_child_idx], parent
    heapify_down(array, smaller_child_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0

    prc ||= Proc.new { |a, b| a <=> b }
    child = array[child_idx]
    parent_idx = parent_index(child_idx)
    parent = array[parent_idx]

    if prc.call(child, parent) < 0
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      heapify_up(array, parent_idx, len, &prc)
    else
      return array
    end
  end
end
