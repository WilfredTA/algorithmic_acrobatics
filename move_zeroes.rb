# Input: Array of integers
# Output: Same array of integers with all zeroes moved to the end
# Rules:
  # The order of the nonzero elements are maintained
  # The array is mutated in-place
# Thoughts
  # Whenever reader encounters a nonzero element, 
  #writer writes value at read and moves up one. 
  #When reader finishes going through the array, 
  #writer starts where it's at and writes zeroes until 
  #the end of the array
  
# Analysis
  # 2 While loops taking N steps -> O(N) Time
  # Constant space usage for two pointers -> O(1) space


def move_zeroes(nums)
  count = 0
  reader = 0
  
  while reader < nums.length do
    if nums[reader] != 0
      nums[count] = nums[reader]
      count += 1
    end
    
    reader += 1
  end
  
  while count < nums.length do
    nums[count] = 0
    count += 1
  end
  nums
end


p move_zeroes([1, 0,2,0,0,4])