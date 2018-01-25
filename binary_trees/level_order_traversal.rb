# Algorithm
  # initialize empty queue
  # tracker node = root
  # while tracker node is not null
    # process tracker node
    # Enqueue tracker node's left childe
    # Enqueue tracker node's right child
    # tracker node := dequeued node
  # end


# Returns array of values of nodes traversed in order
def level_order(root)
  queue = []
  tracker_node = root
  result = []

  while !tracker_node.nil? do
    result << tracker_node.val

    if !tracker_node.left.nil?
      queue << tracker_node.left
    end
    if !tracker_node.right.nil?
      queue << tracker_node.right
    end
    tracker_node = queue.shift
  end

  result
end
