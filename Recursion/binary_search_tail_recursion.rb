def rec_bin(target, nums, start, finish)
  midpoint = (start + finish) / 2
  
  if start > finish
    return -1
  end
  
  if nums[midpoint] == target
   return midpoint
  elsif nums[midpoint] < target
    start = midpoint + 1
    rec_bin(target, nums, start, finish)
  elsif nums[midpoint] > target
    finish = midpoint - 1
    rec_bin(target, nums, start, finish)
  end
end


# Discussion:
# Is this tail call optimized?
# Well, it is tail recursion in that the recursive call is the last
# executed operation in each method's invocation
# Yet, the ruby interpreter does not recognize it as tail-call optimized
# so the question is: do tail call optimized recursive methods have to 
# not only make the recursive call the last invoked expression, but also
# make the recursive call the last line? I.e, will ruby hold onto the current
# level of the stack if the recursive call is not the last line of the method?
# The reason this may be the case is that the interpreter may not yet know
# whether there are any further expressions to be evaluated after the recursive call,
# because during the recursive call, the new level on the stack is added, temporarily
# halting the evaluation of the method invocation.