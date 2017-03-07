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
    bucket(key).include?(key)
  end

  def set(key, val)
    linked_list = bucket(key)
    if linked_list.include?(key)
      linked_list.update(key, val)
    else
      linked_list.append(key, val)
      @count += 1
      resize! if count > num_buckets
    end

  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    del = bucket(key).remove(key)
    @count -= 1 if del
  end

  def each
    @store.each do |linked_list|
      linked_list.each do |link|
        yield(link.key, link.val)
      end
    end
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
    old_store = @store
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    @count = 0
    old_store.each do |linked_list|
      linked_list.each do |link|
        set(link.key, link.val)
      end
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end
end
