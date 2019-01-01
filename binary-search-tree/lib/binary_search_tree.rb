require_relative 'bst_node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value, root = @root)
    new_node = BSTNode.new(value)
    if @root.nil?
      @root = new_node
    elsif value > root.value
      if root.right
        insert(value, root.right)
      else
        root.right = new_node
        new_node.parent = root
      end
    else
      if root.left
        insert(value, root.left)
      else
        root.left = new_node
        new_node.parent = root
      end
    end
  end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?
    case
    when tree_node.value == value
      tree_node
    when value <= tree_node.value
      find(value, tree_node.left)
    when value > tree_node.value
      find(value, tree_node.right)
    end
  end

  def delete(value) # Hibbard deletion
    node_to_delete = find(value)
    return unless node_to_delete
    if node_to_delete.left && node_to_delete.right # node has two children
      replacement_node = maximum(node_to_delete.left)
      # if replacement node has a child, promote it to place of replacement node
      replace_node(replacement_node, replacement_node.left) if replacement_node.left
      replace_node(node_to_delete, replacement_node)
    elsif node_to_delete.left || node_to_delete.right # if one child, just replace with that child
      replacement_node = node_to_delete.left || node_to_delete.right
      replace_node(node_to_delete, replacement_node)
    else # if no children, just erase node
      replace_node(node_to_delete, nil)
    end
  end

  def maximum(tree_node = @root)
    max = tree_node
    max = max.right while max.right
    max
  end

  def depth(tree_node = @root)
    return 0 unless tree_node && (tree_node.left || tree_node.right) # apparently these specs don't count the root
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end 

  def is_balanced?(tree_node = @root)
    # base case: empty or 1 node tree is balanced
    return true if tree_node.nil? || (tree_node.left.nil? && tree_node.right.nil?)
    depth_diff = depth(tree_node.left) - depth(tree_node.right)
    return false unless depth_diff < 2 && depth_diff > -2 # depth can be at most 1 level different
    is_balanced?(tree_node.left) && is_balanced?(tree_node.right) # all subtrees must be balanced
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return [] if tree_node.nil?
    in_order_traversal(tree_node.left).concat([tree_node.value]).concat(in_order_traversal(tree_node.right))
  end

  def pre_order_traversal(tree_node = @root)
    return [] if tree_node.nil?
    [tree_node.value].concat(pre_order_traversal(tree_node.left)).concat(pre_order_traversal(tree_node.right))
  end

  def post_order_traversal(tree_node = @root)
    return [] if tree_node.nil?
    post_order_traversal(tree_node.left).concat(post_order_traversal(tree_node.right)).concat([tree_node.value])
  end

  def reverse_in_order_traversal(tree_node = @root)
    return [] if tree_node.nil?
    reverse_in_order_traversal(tree_node.right).concat([tree_node.value]).concat(reverse_in_order_traversal(tree_node.left))
  end

  private

  def replace_node(node_to_delete, replacement_node)
    if node_to_delete == @root
      @root = nil
    else
      node_to_delete.parent.left = replacement_node if node_to_delete.parent.left == node_to_delete
      node_to_delete.parent.right = replacement_node if node_to_delete.parent.right == node_to_delete
    end
  end
end
