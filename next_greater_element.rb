# Problem Source: https://leetcode.com/problems/next-greater-element-i/description/


# Solution one
# For every element in find_nums, hit every element in nums
# O(MN) Time complextiy, O(N) space
def next_greater_element(find_nums, nums)
  result = []
  find_nums.each do |num|
    i = nums.length - 1
    closest_greater_num = -1
    while nums[i] != num do
      if nums[i] > num
        closest_greater_num = nums[i]
      end

      i -= 1
    end
    result << closest_greater_num
  end

  result
end


# Solution two:
