# Problem source https://leetcode.com/problems/balanced-binary-tree/description/
# Given a binary tree, determine if it is height-balanced.

# For this problem, a height-balanced binary tree is defined as a binary tree
# in which the depth of the two subtrees of every node never differ by more than 1.


# Returns boolean
def is_balanced(root)
  return true if root.nil?

  left, right = root.left, root.right
  left_result = is_balanced(left)
  right_result = is_balanced(right)

  result = right_result && left_result && (max_depth(left) - max_depth(right)).abs <= 1
  result # boolean
end


def max_depth(node)
  return 0 if node.nil?

  left,right = node.left, node.right
  left_result = max_depth(left)
  right_result = max_depth(right)

  result = [left_result, right_result].max + 1
  result
end

# Big-O:
# The is_balanced calls itself for every node in the tree, giving its recursion an O(N). It also calls
# max_depth for every node in the tree. Note that max_depth also has a time complexity of O(N).
# Therefore, is_balanced makes a total of N^2 calls: O(N^2)
