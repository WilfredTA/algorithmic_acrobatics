# Problem source
# Algorithm
# Lead/follow pointers
# returns the element at index of follow
# Keeps track of the occurrences of follow by comparing follow to lead
# Every element not equal to follow cancels out one occurrence of follow

def majority_element(nums)
  follow = 0
  count = 1
  lead = 1

  while lead < nums.length do
    if nums[follow] == nums[lead]
      count += 1
    else
      count -= 1
    end

    if count == 0
      follow = lead
      count = 1
    end
    lead += 1
  end

  nums[follow]
end

p majority_element([3,2,3,4,5,3,3,6])
