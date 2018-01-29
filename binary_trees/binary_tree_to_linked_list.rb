# flatten a binary tree to a linked list in place

# DnC Approach
# The base case is a node with no children
# In this case, the parent of this node will do one of two things:
  # if the child is a left_node, it will make it a right node and then assign
  # the right result to it
  # otherwise, if it is a right node it will do nothing

# Terminal conditions in the recursion are when a node has one or two child nodes
# and those child nodes are leaf nodes.
# When that is the case, the end-result should always be:
# before that head node returns, all nodes should be on its right, with the left node
# as the first on its right:
def flatten(root)
  return root if root.nil?
  return root if (root.right.nil? && root.left.nil?)


  left = root.left
  right = root.right
  left_result = flatten(left)
  right_result = flatten(right)


  if left_result # checks to see if left subtree exists
    root.right = left_result
    while left_result.right # Gets the leaf node on the right side of left subtree
      left_result = left_result.right
    end
    left_result.right = right_result #links the right_result to the final leaf node in left_result
  end


  root.left = nil
  root
end


# Recursive Traversal Approach
