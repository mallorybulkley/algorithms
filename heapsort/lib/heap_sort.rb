require_relative "heap"

class Array
  def heap_sort!
    # Time: O(nlogn), Space: O(n)
    # heap = BinaryMinHeap.new
    # count.times { heap.push(pop) }
    # heap.count.times { self << heap.extract }
    # self

    # In-place version, treat partioned array as a heap
    # Time: O(nlogn), Space: O(1)
    max_prc = Proc.new { |a, b| b <=> a } # use max heap so you don't have to reverse at the end
    (2..length).each do |heap_size|
      BinaryMinHeap.heapify_up(self, heap_size - 1, heap_size, &max_prc)
    end

    length.downto(2).each do |heap_size|
      self[0], self[heap_size - 1] = self[heap_size - 1], self[0]
      BinaryMinHeap.heapify_down(self, 0, heap_size - 1, &max_prc)
    end

    self
  end
end
