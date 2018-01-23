# Problem source https://leetcode.com/problems/invert-binary-tree/description/
# An inverted binary tree is one in which each parent's subtrees are swapped


def invert_tree(root)
  return root if root.nil?

  left = root.left
  right = root.right
  invert_tree(left)
  invert_tree(right)

  temp = root.left
  root.left = root.right
  root.right = temp

  root
end
