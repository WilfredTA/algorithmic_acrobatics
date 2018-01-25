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



# Problem with above approach: No way to track when a new level is hit.
# Algorithm
  # initialize queue as [root]
  # while queue is not empty
	# loop across queue queue.size number of times
		# tracker node := dequeued node
		# process tracker node
		# Enqueue tracker node's left childe
		# Enqueue tracker node's right child
  # end


# Assumption: The size of the queue after each level is processed is equivalent to the
# number of nodes on that level.

=begin
         1
       /   \
      2     3
    /  \   / \ 
   3    4 4  5

level 1 queue: [1].
level 2 queue: [2,3]
level 3 queue: [3,4,4,5]

=end

def level_order(root)
  queue = [root]
  tracker_node = root
  result = []
  return result if root.nil?
  level = 0


  while !queue.empty? do
    temp_result = []
    queue.size.times do
      tracker_node = queue.shift
      temp_result << tracker_node.val
      if !tracker_node.left.nil?
        queue << tracker_node.left
      end
      if !tracker_node.right.nil?
        queue << tracker_node.right
      end
    end
    level += 1
    result << temp_result
  end

  result
end
