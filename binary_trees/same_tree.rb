# Problem source https://leetcode.com/problems/same-tree/description/
# Given two binary trees, write a function to check if they are the same or not.

# Two binary trees are considered the same if they are structurally identical
# and the nodes have the same value.

# Assumption, if every node is visited in the same order, each current_node on one tree
# should be equivalent to the current node on the other tree AND they should end at the
# same time

# returns boolean
def is_same_tree(root1, root2)
  return true if root1.nil? && root2.nil?
  return false if root1.nil? || root2.nil?

  left_res = is_same_tree(root1.left, root2.left)
  right_res = is_same_tree(root1.right, root2.right)

  result = root1.val == root2.val && left_res && right_res
  result # boolean
end


# Since all non-recursive calls are O(1) operations, and since the method makes
# a recursive call for every node in tree M and every node in tree N at worst, the
# time complexity for the above method is O(MN)
