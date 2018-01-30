# Problem Source https://leetcode.com/problems/combinations/description/
def combine(n, k)
  result = []
  combine_helper(n, k, result, [], 1)
  result
end


def combine_helper(final_num, max_size, result, solution, start)
  if solution.size == max_size
    result << solution.clone
  else
    (start..final_num).each do |num|
      next if solution.include?(num)
      solution << num

      combine_helper(final_num, max_size, result, solution, num + 1)
      solution.pop
    end
  end
end
