# Problem Source https://leetcode.com/problems/combination-sum/description/

# A valid combination is any combinatin of numeric values in the input that add up to
# the target.

# A combination can include the numeric value located at the same index multiple times
# in other words, for an input array [1,2,3], combination [1,2,1] is valid


# A combination is invalid if it does not add up to the target element or if some arrangement
# of its numeric values is already included in the results.
# In other words, if the result array is: [[1,2,2], [2,3]], then [2,2,1] is an invalid combination

# Difference between a combination and a set:
# A subset cannot be constructed by using a value at a specific index more than once.
# Given a set [1,2,3], [2,2] is not a valid subset, but it is a valid combination

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
# Need a more efficient way to PREVENT any combination's permutations from being added to
# the results

# Since the imput array of numbers does not contain duplicates, at each root of the
# decision tree, we can make sure that the element at the index of that root will not
# only show up in THAT root's subtrees and not the subtrees of the roots formed at the next elements:

# Time complexity:

def combination_sum(candidates, target)
  result = []
  solution = []
  sum_helper(candidates, target, solution, result, 0)
  result
end


def sum_helper(candidates, target, solution, result, start_idx)
  curr_sum = solution.reduce(:+)
  if curr_sum && curr_sum > target
  elsif curr_sum == target
    result << solution.clone
  else

    (start_idx..candidates.length-1).each do |idx|
      solution << candidates[idx]
      sum_helper(candidates, target, solution, result, idx)
      solution.pop
    end
  end
end

p combination_sum([2,3,7], 7)



# Combination sum II

# Same as above, but there can be duplicate values in the array. Further, combinations cannot
# use the element at the same index more than once, nor can permutations of the same combination
# be included in the result array

# Since there can be duplicate values, such as [1,7,1], a modified above-solution that prevented
# an element at an index being used more than once in a single combination would still not work
# because [1,7,1] would have two solutions: [1,7] and [7,1] since the 1's exist at different indices.

# However, if we sorted the input array: [1,1,7] and then checked the results array for a combination
# before adding that combination to the results array, then we would notice that [1,7] was in there and
# when the second [1,7] came about, it would not be added:

# Problem source https://leetcode.com/problems/combination-sum-ii/description/
def combination_sum2(candidates, target)
    result = []
    helper(candidates.sort, target, 0, 0, [], result)
    result
end


def helper(nums, target, curr_pos, curr_sum, solution, result)
  if curr_sum == target
    result << solution.clone if !result.include?(solution)
  elsif curr_sum > target
    # Do nothing
  else
    (curr_pos..nums.length-1).each do |idx|
      solution << nums[idx]
      helper(nums, target, idx + 1, curr_sum + nums[idx], solution, result)
      solution.pop
    end
  end
end
