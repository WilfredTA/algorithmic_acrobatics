# Problem Description: 
# You are climbing a stair case. 
# It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps. 
# In how many distinct ways can you climb to the top?

# Note: Given n will be a positive integer. 

# Example: climb(2) == 2
# climb(3) == 3
# climb(4) == 5

# Breaking the problem down
	# 1. Define the GENERAL problem in 
	#    terms of smaller versions of itself
		
		# If you are at the step right before N, there are two
		# possible places you can be: at N-1 or N-2. Therefore
		# the number of steps it takes to get to N is equal to
		# the num of steps to get to N - 1 PLUS the num of steps
		# to get to N - 2
	# So, climb(n) == climb(n-1) + climb(n-2)

	# 2. Create the recursive solution:
		# A) #The function and params:
			 #The recursive solution takes one param, the num of steps
		# B) The reduction:
		     #The recursive solution is equal to solution(n-1) + solution(n-2) 
		# C) The base case (when is the problem trivially solvable):
			 # When n is 0, there is one way to get to the top.
			 # When n is 1, there is one way to get to the top.

			 # I could also put when n is 2 here, since it is trivially
			 # solvable, but it is not the MOST trivially solvable, so it is not
			 # a base case
		# D) What will it always return: an integer

# Implement the recursive solution

def climb_stairs(n)
	return 1 if n <= 1
	climb_stairs(n-1) + climb_stairs(n-2)
end

# Evaluate: Does this solution call for memoization?
	# This depends: does it perform the same computation multiple times?
	# Does climb_stairs(n-1) and climb_stairs(n-2) ever compute the same value?
	# It does:
		# if input is 10
			# 9 and 8
#   8 and 7   7 and 6
# 7 & 6  6&5 6&5   5 & 4
# So, this problem calls for memoization

def climb_stairs_memo(n, cache={})
	return 1 if n <= 1
	operand_one = cache[n-1] || climb_stairs_memo(n-1)
	operand_two = cache[n-2] || climb_stairs_memo(n-2)
	result = operand_one + operand_two
	cache[n] = result
	result
end

	