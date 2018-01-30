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
