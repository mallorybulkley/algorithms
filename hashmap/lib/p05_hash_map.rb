require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)
    if @store[bucket(key)].include?(key)
      @store[bucket(key)].update(key, val)
    else
      resize! if count == num_buckets
      @count += 1
      @store[bucket(key)].append(key, val)
    end
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    return unless @store[bucket(key)].include?(key)
    @count -= 1
    @store[bucket(key)].remove(key)
  end

  def each
    @store.each { |ll| ll.each { |node| yield(node.key, node.val) } }
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { LinkedList.new }
    @store.each do |ll|
      ll.each do |node|
        new_store[node.key.hash % (num_buckets * 2)].append(node.key, node.val)
      end
    end
    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    key.hash % num_buckets
  end
end
