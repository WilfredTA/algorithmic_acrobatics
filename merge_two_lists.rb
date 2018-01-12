# Merge two lists algorithm
# Dummy head with three pointer, l1, l2, and current
# Set current := dummy head
# Current.next := lesser of l1 and l2
# Increment L1 or l2 (whichever was set to current.next)
# finally, incremment current := current.next
# continue as long as l1 and l1 are not nil


def merge_two_lists(l1, l2)
  dummy = ListNode.new(0)
  current = dummy
  
  while !l1.nil? && !l2.nil? do
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end
  
  if !l1.nil?
    current.next = l1
  elsif !l2.nil?
    current.next = l2
  end
  dummy.next
end