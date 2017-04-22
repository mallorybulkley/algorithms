class QuickUnion
  attr_accessor :array

  def initialize(size)
    @array = (0...size).to_a
  end

  def connected?(i, j)
    root(i) == root(j)
  end

  def root(i)
    return i if array[i] == i
    root(array[i])
  end

  def union(i, j)
    array[root(i)] = root(array[j])
  end
end

class WeightedQuickUnion
  attr_accessor :array, :sizes, :count

  def initialize(size)
    @array = (0...size).to_a
    @sizes = Array.new(size, 1)
    @count = size
  end

  def connected?(i, j)
    root(i) == root(j)
  end

  def root(i)
    while array[i] != i
      array[i] = array[array[i]]
      i = array[i]
    end

    i
  end

  def union(i, j)
    root_i = root(i)
    root_j = root(j)
    return if root_i == root_j

    if sizes[i] < sizes[j]
      array[root_i] = root_j
      sizes[root_j] += sizes[root_i]
    else
      array[root_j] = root_i
      sizes[root_i] += sizes[root_j]
    end

    @count -= 1
  end
end
