# Compute the sum of node values on the outer right of the tree:

=begin
        1
      /  \
    2     3
  / \    / \
 4   5  6   7

The outer right of this tree would be [1,2,4,5,6,7,3] and the sum would be:
28
=end




def outside_ring(root)
  left_side, left_leaf = preorder_modified(root)
  right_side, right_leaf = postorder_modified(root)

  leaves = bfs_modified(root, left_leaf, right_leaf)

  leaves.concat(left_side.concat(right_side)).reduce(:+)
end

def bfs_modified(root, left_leaf, right_leaf)
  queue = [root]
  result = []

  while !queue.empty? do
    current = queue.shift
    queue << current.left if current.left
    queue << current.right if current.right

    unless current.right || current.left || current == left_leaf || current == right_leaf
      result << current.val
    end
  end
  result
end
def postorder_modified(root, result =[])

  if root.right.nil? && root.left.nil?
    result << root.val
    result.shift
    return [result, root]
  else
    result << root.val
  end

  if root.right
    postorder_modified(root.right, result)
  else
    postorder_modified(root.left, result)
  end

end
def preorder_modified(root, result = [])
  if root.right.nil? && root.left.nil?
    result << root.val
    return [result, root]
  else
    result << root.val
  end

  if root.left
    preorder_modified(root.left, result)
  else
    preorder_modified(root.right, result)
  end
end




def preorder(root, result = []) # Normal preorder recursive traversal
  return if root.nil?

  result << root.val

  preorder(root.left, result)
  preorder(root.right, result)
  result

end


def preorder_stack(root) # Normal preorder w/ stack
  stack = [root]
  result = []
  while !stack.empty? do
    current = stack.pop

    stack << current.right unless current.right.nil?
    stack << current.left unless current.left.nil?
    result << current.val
  end
  result
end

def bfs(root) # Normal bfs
  queue = [root]
  result = []

  while !queue.empty? do
    current = queue.shift
    queue << current.left if current.left
    queue << current.right if current.right
    result << current.val

  end
  result
end
class TreeNode
  attr_accessor :left, :right, :val

  def initialize(value)
    @val = value
    @left = nil
    @right = nil
  end
end

root = TreeNode.new(0)

root_left = TreeNode.new(1)
root.left = root_left

root_right = TreeNode.new(2)
root.right = root_right

left_left = TreeNode.new(3)
left_right = TreeNode.new(4)
root_left.left = left_left
root_left.right = left_right

lll = TreeNode.new(5)
left_left.left = lll

right_r = TreeNode.new(6)
root_right.right = right_r

rrr = TreeNode.new(7)
right_r.right = rrr


#p preorder_stack(root) # [0, 1, 3, 5, 4, 2, 6, 7]
#p bfs(root) # [0, 1, 2, 3, 4, 6, 5, 7]
p outside_ring(root) # 28
