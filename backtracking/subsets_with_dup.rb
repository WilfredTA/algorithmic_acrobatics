# Problem Source https://leetcode.com/problems/subsets-ii/#/description

# A subset is a set of elments that exists within another set. Subsets do not contain
# duplicates of the set of which is is a subset.

# Rules:
# A subset may contain a duplicate numeric value, at most, the amount of times
# the numeric value appears in the input set at DIFFERENT indices.
# E.g., a [2,2] is NOT a subset of [1,2,3] but it IS a subset of [1,2,2]

# Approach 1:
# Dead end logic: prevent any duplicate combinations from going into results
  # e.g., if results contains [1,2,2,3], then prevent all permutations of [1,2,2,3]

# Branch logic: At each recurse, remove already considered indices from possible ones

def subsets_with_dup(nums)
  result = []
  subsets_helper(nums, result, [], 0)
  result
end


def subsets_helper(nums, result, current_solution, start_idx)

  result << current_solution.clone if !has_combination(result, current_solution)
  nums.each_with_index do |num, idx|
    next if idx < start_idx
    current_solution << num
    subsets_helper(nums, result, current_solution, idx + 1)
    current_solution.pop
 end
end

def has_combination(collection, test)
  collection = collection.map do |subarr|
    subarr.sort
  end
  test = test.sort

  collection.include?(test)
end

# Approach 2
# Sort input array
# Dead-end logic: don't push if result includes current solution
# Branching: Each recurse starts at 1 index > the method call that called it

def subsets_with_dup(nums)
  result = []
  nums.sort!
  subsets_helper(nums, result, [], 0)
  result
end


def subsets_helper(nums, result, current_solution, start_idx)

  result << current_solution.clone unless result.include?(current_solution)
  (start_idx..nums.length - 1).each do |idx|

    current_solution << nums[idx]
    subsets_helper(nums, result, current_solution, idx + 1)
    current_solution.pop
 end
end

# Why we need to sort:
# Imagine the array is not sorted and we have he following input: [4,4,1,4]
# In this input, the first decision tree whose root is the first element will
# construct the following subset: [4,4,1], but then the second decision tree
# whose root is the second element will construct the following subset: [4,1,4]
# This is a problem because [4,4,1] and [4,1,4] are permutations of each other and
# thus are not allowed in the results array

# Compare that to if it is sorted: [1,4,4,4]
# All subsets with 1 in them will be constructed first, and subsequent subsets constructed
# Will NOT contain ones in them. The reason for this is that the above backtracking solution
# will only create multiple permutations of the same subset if there are values sandwiched between
# duplicates. But if duplicates are all adjacent with non-same elements on either side, then
# we can use the manipulation of starting indices to eliminate elements that have already been used
