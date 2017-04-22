class QuickFind
  attr_accessor :array

  def initialize(size)
    @array = (0...size).to_a
  end

  def connected?(i, j)
    array[i] == array[j]
  end

  def union(i, j)
    id_i = array[i]
    id_j = array[j]

    (0..array.length).each do |idx|
      array[idx] = id_j if array[idx] == id_i
    end

    array
  end
end
