# Return an array containing the average of the values on each level in a binary tree


def average_of_levels(root)
  queue = [root]
  tracker_node = root
  result = []
  return 0 if root.nil?



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

    size = temp_result.size
    sum = temp_result.reduce(:+)
    result << sum.to_f/size
  end

  result
end
