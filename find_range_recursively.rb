# Recursive Binary Search

# Binary search for first element of a specific value in a sorted array
# Params it will need: nums, target, minimum idx so far, start idx, end idx
# Base case: if start exceeds finish (meaning all elements have been searched)


def range_recurse(nums, target)
  start = min_helper(target, nums, 0, nums.length - 1, nil)
  finish = max_helper(target, nums, 0, nums.length - 1, nil)
  [start, finish]
end


def min_helper(target, nums, start, finish, first_occurrence)
  midpoint = (start + finish) / 2
  
  if start > finish
    return first_occurrence || -1
  end
  
  if nums[midpoint] == target
    first_occurrence = midpoint
    finish = midpoint - 1
    min_helper(target, nums, start, finish, first_occurrence)
  elsif nums[midpoint] < target
    start = midpoint + 1
    min_helper(target, nums, start, finish, first_occurrence)
  elsif nums[midpoint] > target
    finish = midpoint - 1
    min_helper(target, nums, start, finish, first_occurrence)
  end
end

def max_helper(target, nums, start, finish, last_occurrence)
  midpoint = (start + finish) / 2
  
  if start > finish
    return last_occurrence || -1
  end
  
 
  if nums[midpoint] == target
    last_occurrence = midpoint
    start = midpoint + 1
    max_helper(target, nums, start, finish, last_occurrence)
  elsif nums[midpoint] < target
    start = midpoint + 1
    max_helper(target, nums, start, finish, last_occurrence)
  elsif nums[midpoint] > target
    finish = midpoint - 1
    max_helper(target, nums, start, finish, last_occurrence)
  end
end




p range_recurse( [5,7,7,8,8,8,10], 8)