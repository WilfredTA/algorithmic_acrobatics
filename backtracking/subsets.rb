# Problem Source https://leetcode.com/problems/subsets/description/


# At each level, push element into solution and check if result includes
# current solution.
# if it does, backtrack
# otherwise, push it to result



def subsets(nums)
  result = []
  subsets_helper(nums, result, [], 0)
  result
end


def subsets_helper(nums, result, current_solution, start_idx)

  result << current_solution.clone #unless result.include?(current_solution)
  nums.each_with_index do |num, idx|
    next if current_solution.include?(num) || idx < start_idx
    current_solution << num
    p start_idx
    subsets_helper(nums, result, current_solution, idx + 1)
    current_solution.pop
 end
end

p subsets([1,2,3])

# SHOULD return:
# [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]
