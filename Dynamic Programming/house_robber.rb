
# Problem source https://leetcode.com/problems/house-robber/description/
def rob(nums)
      if nums.length == 0
        return 0
    end
    
    if nums.length == 1
        return nums[0]
    end
    
    rob_helper(nums, nums.length - 1, {})
    
end

def rob_helper(nums, current, cache)
    if current <= 0
        return nums[0]
    end
    
    if current <= 1
        return nums[0..current].max
    end
    
    return cache[current] if cache[current]
    result1 = rob_helper(nums, current - 1, cache)
    
    result2 = rob_helper(nums, current - 2, cache) + nums[current]
    
    cache[current] = [result1, result2].max
    
end