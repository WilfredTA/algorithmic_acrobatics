# Problem Source https://leetcode.com/problems/combination-sum/description/

# Currently runs too slowly

# The logic to handle same-cobinations of numbers but in different order
# is placed in the dead end logic rather than the branching logic


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
