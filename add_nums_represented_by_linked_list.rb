# Add two numbers
# Two numbers in reverse order
# counter idx, add num ^ 10^counter to sum


def add_two_numbers(l1, l2)
  counter = 0
  sum = 0
  
  while !l1.nil? && !l2.nil? do
    sum += (l1.val + l2.val) * 10**counter
    counter += 1
    l1 = l1.next
    l2 = l2.next
  end
  sum
end