# takes in a binary search tree (as a tree_node) and an integer k, 
# returns the kth largest element in the BST
# could be more efficient by keeping a count of elements and stopping at k instead of traversing the whole tree
def kth_largest(tree_node, k)
    reverse_in_order_traversal(tree_node)[k - 1]
end

def reverse_in_order_traversal(tree_node)
    return [] if tree_node.nil?
    reverse_in_order_traversal(tree_node.right).concat([tree_node]).concat(reverse_in_order_traversal(tree_node.left))
end


