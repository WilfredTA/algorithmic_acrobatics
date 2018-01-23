# Problem source https://leetcode.com/problems/maximum-depth-of-binary-tree/description/

#Given a binary tree, find its maximum depth.

#The maximum depth is the number of nodes along the longest path from the
# root node down to the farthest leaf node.

# The max depth of a binary tree is the max between the left and right trees + 1


# This is a structural problem about the nature of a recursive data structure, therefore
# divide and conquer is the best approach


# Return value: integer
def max_depth(node)
  return 0 if node.nil?

  left,right = node.left, node.right
  left_result = max_depth(left)
  right_result = max_depth(right)

  result = [left_result, right_result].max + 1
  result
end


# Big-O
# Each method call does onnly O(1) operations outside of the recursive call.
# Therefore, the amount of operations scales according to the number of recursive calls
# The number of recursive calls is always equivalent to the number of nodes in the tree,
# giving this solution O(N) time complexity
