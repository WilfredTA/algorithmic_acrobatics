# Find the root to leaf sum of the left and right subtrees then add them together

# Examples:

# =>     1
# =>   /   \
#     2    3
#   /  \  / \
#  1   3 2   5

# 1213 + 1325

# Walking through left subtree:
# sum = 1
# sum = 10 + 2
# sum = 100 + 20 + 1
# sum = 1000 + 200 + 10 + 3
# Accumulator val multiplied by 10 each time and adds current val of node to it

# Algorithm:
# preorder traversal (because root node is first element in numbers)
# process step: accumulator = accumulator * 10 + current_node.val




# First attempt (failing)


def sum_numbers(root, accumulator = {val: 0})
    return 0 if root.nil?

    accumulator[:val] = accumulator[:val] * 10 + root.val


    sum_numbers(root.left, accumulator) + sum_numbers(root.right, accumulator)
    accumulator[:val]
end


# Problem w/ first attempt:
#   0
#  / \
# 1   3

# This returns 13 with first attempt but should return 4

# val = 0
# val = 0 + 1
# val = 0 + 10 + 3


# But it should be:
# val = 0
# val = 0 + 1
# val = ( 0 + 1) + 3

# Can't just return accumulator itself at the end of method if accumulator is an integer
# because the method will always return the value of the root node itself since the
# accumulator reassignment on each recursive call does not affect the accumulator value
# in the preceding levels of the call stack.

# This property can be advantageous though: if the accumulator at the bottom of the
# call stack (i.e. the first level) is just the value of the root, then we can make the
# recursive call to each side of the tree (left and right) return its final cumulative value

# This way, each subtree starts with the value of the topmost root node and the first
# call at the bottom of the stack returns the sum of the two accumulators since the recursive
# call returns the value of the accumulator if it hits a leaf node


# Second Attempt (passing)
def sum_numbers(root, accumulator = 0)
  return 0 if root.nil?

  accumulator = accumulator * 10 + root.val

  if root.left.nil? && root.right.nil? # if a leaf node has been hit, return the cumulative value
    return accumulator
  end

  sum_numbers(root.left, accumulator) + sum_numbers(root.right, accumulator)
end
