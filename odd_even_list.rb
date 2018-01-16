
=begin
Given 1->2->3->4->5->NULL,
 1-> 3 -> 5
 2 -> 4 -> null
trackers:
  first even node
  first odd node
  previous even
  current even node
  current odd node
  

return 1->3->5->2->4->NULL. 
=end

def odd_even_list(head)
  return head if head.nil? || head.next.nil?
  first_even = head.next
  current_odd = first_odd
  current_even = first_even
  
  
  while !current_odd.next.nil? && !current_even.next.nil? do
    current_odd.next = current_odd.next.next
    current_even.next = current_even.next.next
    
    current_odd = current_odd.next
    current_even = current_even.next
  end
  
  current_odd.next = first_even

  head
end