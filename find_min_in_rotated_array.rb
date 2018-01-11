# Algorithm
# Given a rotated array, binary search for minimum number
# Pivot condition: if last element > midpoint, then pivot left
# else, pivot right
# Return the final number



def find_min(nums)
  left = 0
  right = nums.length - 1

  while left <= right do
    midpoint = (left + right) / 2
    if nums[midpoint] < nums[-1] #ascending sequence
      right = midpoint - 1
    elsif nums[midpoint] > nums[-1]
      left = midpoint + 1
    else
      return nums[midpoint]
    end
  end

   nums[midpoint] > nums[midpoint + 1] ? nums[midpoint+1] : nums[midpoint]
end
  
