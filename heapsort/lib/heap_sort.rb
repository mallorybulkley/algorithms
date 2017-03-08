require_relative "heap"

class Array
  def heap_sort!
    2.upto(count).each do |heap|
      BinaryMinHeap.heapify_up(self, heap - 1, heap)
    end

    count.downto(2).each do |heap|
      self[heap - 1], self[0] = self[0], self[heap - 1]
      BinaryMinHeap.heapify_down(self, 0, heap - 1)
    end

    self.reverse!
  end
end

# O(n log n)
# Space: O(1) - sorts in place
