require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    existing_node = @map[key]
    if existing_node
      update_node!(existing_node)
      existing_node.val
    else
      eject! if @map.count == @max
      val = calc!(key)
      new_node = @store.append(key, val)
      @map[key] = new_node
      new_node.val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @prc.call(key)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    node.remove
    @store.append(node.key, node.val)
  end

  def eject!
    lru_node = @store.first
    lru_node.remove
    @map.delete(lru_node.key)
  end
end
