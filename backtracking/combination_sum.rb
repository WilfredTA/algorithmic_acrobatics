# Problem Source https://leetcode.com/problems/combination-sum/description/

# Currently runs too slowly

# The logic to handle same-cobinations of numbers but in different order
# is placed in the dead end logic rather than the branching logic


# Solution 1: Too slow
# Algorithm:
# Walk through each possible combination, including those that use the same
# element at the same index more than once.
# If the sum of a given combination adds up to target sum, check if
# the results already contains a subarray that has all the same numbers
# as those in the current solution. If it doesn't, then push the new solution
# to results array
# This process is bottlenecked by this inclusion check, which uses many sorts.
# Time complexity analysis:

def combination_sum(candidates, target)
    result = []
    sum_helper(candidates, target, [], result)
    result
end



def sum_helper(nums, target, solution, result)
  solution_sum = solution.reduce(:+)

  if solution_sum == target && !has_combination(result, solution)
    result << solution.clone

  elsif solution_sum && solution_sum > target

  else
    nums.each do |num|
      solution << num
      sum_helper(nums, target, solution, result)
      solution.pop
    end
  end
end


def has_combination(collection, test)
  collection = collection.map do |subarr|
    subarr.sort
  end
  test = test.sort

  collection.include?(test)
end

#p combination_sum([2,3,6,7], 7)


# Solution 2
# Rules of the problem:
# The number at any index can be used more than once
# For some arrangement of numeric values, the arrangement cannot appear
# more than once in the result array, where an arrangement is an unordered list.
# e.g., the arrangement represented by [3,2,2] is the same as [2,3,2]

# Need a way to prevent arrangements from being placed in the result array
# that does not use the has_combination bottleneck

# Algorithm:
# 
# Time complexity: 
