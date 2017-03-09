require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[rand(array.length)]

    left = array.select { |n| n < pivot }
    middle = array.select { |n| n == pivot }
    right = array.select { |n| n > pivot }

    sort1(left) + middle + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    return array if length < 2

    pivot = partition(array, start, length, &prc)

    left_len = pivot - start
    right_len = length - left_len - 1
    sort2!(array, start, left_len, &prc)
    sort2!(array, pivot + 1, right_len, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |a, b| a <=> b }

    # shuffle pivot
    random_pivot = start + rand(length)
    array[start], array[random_pivot] = array[random_pivot], array[start]

    pivot_idx = start
    pivot = array[start] # pivot stays the same throughout the partitioning

    ((start + 1)...(start + length)).each do |i|
      if prc.call(array[i], pivot) < 0
        array[i], array[pivot_idx + 1] = array[pivot_idx + 1], array[i]
        pivot_idx += 1
      end
    end
    array[start], array[pivot_idx] = array[pivot_idx], array[start]

    pivot_idx
  end
end
