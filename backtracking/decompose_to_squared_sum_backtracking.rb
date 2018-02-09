# Problem source https://www.codewars.com/kata/square-into-squares-protect-trees/train/ruby
=begin
Given a positive integral number n, return a strictly increasing sequence (list/array/string depending on the language) of numbers, so that the sum of the squares is equal to n².

If there are multiple solutions (and there will be), return the result with the largest possible values:

Examples
decompose(11) must return [1,2,4,10]. Note that there are actually two ways to decompose 11², 11² = 121 = 1 + 4 + 16 + 100 = 1² + 2² + 4² + 10² but don't return [2,6,9], since 9 is smaller than 10.

For decompose(50) don't return [1, 1, 4, 9, 49] but [1, 3, 5, 8, 49] since [1, 1, 4, 9, 49] doesn't form a strictly increasing sequence.
=end



# Algorithm naive:
# Backtracking
# Branch condition: current number - 1
# Dead end condition: If sum of squares of an array of nums is equal to the given number ^ 2
# then return that number
# Otherwise if sum of squares is greater than the target number then backtrack

# Guarantees no duplicates because every next number can be at most 1 less than the preceding number


# Space complexity: O(N) (there are N levels of the call stack at most)
# Time complexity:
# There are N levels of the recursive call stack and there are, at most, N recursive calls on each level
# Further, all operations during each recursive call run in constant time, meaning that there are N^2 operations at most.

def decompose(num)
  solution = []
  final_sequence = {final: []}
  result = {result: false}
  helper(num-1, solution, num**2, result, final_sequence, 0)
  if final_sequence[:final].empty?
    nil
  else
    final_sequence[:final].reverse
  end
end


def helper(current, solution, goal, result, final_sequence, current_square)
  if current_square == goal
    result[:result] = true
    final_sequence[:final] = solution.clone
  elsif current_square > goal || result[:result]
    # do nothing
  else
    while current > 0 do
      break if result[:result]
      solution << current
      helper(current - 1, solution, goal, result, final_sequence, current_square + current**2)
      solution.pop
      current -= 1
    end
  end
end


p decompose(50) #[1,3,5,8,49]
