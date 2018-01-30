# Problem Source https://leetcode.com/problems/subsets-ii/#/description

# A subset is a set of elments that exists within another set. Subsets do not contain
# duplicates of the set of which is is a subset.


# Passes but runs slowly. The logic that accounts for not adding the same element in twice
# is to use the index of current branch


def subsets_with_dup(nums)
  result = []
  subsets_helper(nums, result, [], 0, nil)
  result
end


def subsets_helper(nums, result, current_solution, start_idx, current_idx)

  result << current_solution.clone if !has_combination(result, current_solution)
  nums.each_with_index do |num, idx|
    next if idx == current_idx || idx < start_idx
    current_solution << num
    subsets_helper(nums, result, current_solution, idx + 1, idx)
    current_solution.pop
 end
end

def has_combination(collection, test)
  collection = collection.clone.map do |subarr|
    subarr.sort
  end
  test = test.clone.sort

  collection.include?(test)
end
