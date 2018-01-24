# Problem source
# Traverse a binary tree in preorder without using recursion. Instead, use iteration


# Algorithm
# Initialize a stack to have root's right node
# Initialize an array of traversed nodes
# While the stack is not empty
#   current node := current node's left node
#   stack.push current node's right node
#   if current node
#     push node into traversed nodes
#     process current node
#   else
#     current node := stack.pop
#   end
# end

class Node
  attr_accessor :right, :left. :val
  def initialize(val)
    @right = nil
    @left = nil

    @val = val
  end

end
def preorder_traversal(root)
  visited_nodes = []
  return visited_nodes if root.nil?

  stack_of_right_nodes = []
  stack_of_right_nodes << root.right
  current_node = root

  while !stack_of_right_nodes.empty? do
    visited_nodes << current_node.val
    if current_node.right
        stack_of_right_nodes << current_node.right
    end

    if current_node.left
      current_node = current_node.left
    else
      current_node = stack_of_right_nodes.pop
    end

  end
  visited_nodes
end


root = Node.new
right = Node.new
root.right = right
left = Node.new
right.left = left
