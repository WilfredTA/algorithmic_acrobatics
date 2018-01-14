# Fibonacci with recursion and memoization
# A fibonacci number is the sum of the two preceding fibonacci numbers
# fibo(n) = fibo(n-1) + fibo(n-2)
# fibo(2) = 1
# fibo(3) = 2
# fibo(4) = 3

# Runtime O(N)
# Space O(N)

# The run time is O(N) because no fibonacci number is computer more than once. Rather, before each new computation, an O(1) hash table lookup is performed for the result of the fibonacci call.


@memo = {}
def fibo(n)
  if n < 2
    return n
  end
  
  if @memo[n]
    return @memo[n]
  else
    @memo[n] = fibo(n-1) + fibo(n-2)
  end
end