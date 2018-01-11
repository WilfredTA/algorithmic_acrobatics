#Algorithm
# What is a peak element?
# A peak element is an element greater than its neighbors
# At any point in the array, a number is either part of an ascending or descending sequence
# if it is part of an ascending sequence, then a peak MUST exist to its right
  # Why? Because either the sequence continues to increase until the end of the array, which means the final element is a peak, or it continues to increase and then decreases again, meaning that max num that occurs before decreasing begins is the peak

# if it is part of a descending sequence, then that means a peak must exist to its left, because either the sequence continues to decrease to the right/increase to the left until the beginning or before the beginning, and in either case a peak is found



def find_peak_element(nums)
  left = 0
  right = nums.length - 1

  while left <= right do
    midpoint = (left + right) / 2

    if nums[midpoint+1] && nums[midpoint] < nums[midpoint + 1] #ascending sequence
      left = midpoint + 1
    elsif nums[midpoint-1] && nums[midpoint] < nums[midpoint - 1] #descending sequence
      right = midpoint - 1
    else # num at midpoint is > midpoint + 1 and > midpoint - 1
      return midpoint
    end
  end
end


p find_peak_element([1, 2, 3, 1])
p find_peak_element([1,2])
p find_peak_element([1, 2])
