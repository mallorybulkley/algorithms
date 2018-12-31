require_relative 'heap'

def k_largest_elements(array, k)
    max_prc = Proc.new { |a, b| b <=> a }
    heap = BinaryMinHeap.new(&max_prc)
    array.each { |el| heap.push(el) }

    k_els = []
    k.times { k_els << heap.extract }

    k_els
end
