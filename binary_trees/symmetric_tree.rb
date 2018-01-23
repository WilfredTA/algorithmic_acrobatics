# Problem Source https://leetcode.com/problems/symmetric-tree/description/


# A binary tree is symmetric if its left subtree is a mirror reflection of its
# right subtree... Need to define "mirror reflection"

# A tree is a mirror reflection of another tree when their root nodes have the
# same value and when the right subtree of each tree is the mirror reflection of the
# left subtree of each tree



def is_symmetric(node)
  symmetric_helper(node, node)
end

def symmetric_helper(node1, node2)
  return true if node1.nil? && node2.nil?
  return false if node1.nil? || node2.nil?


  res1 = symmetric_helper(node1.left, node2.right)
  res2 = symmetric_helper(node1.right, node2.left)

  res1 && res2 && node1.val == node2.val
end
