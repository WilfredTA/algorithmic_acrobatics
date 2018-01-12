# Remove duplicates from sorted linked list algorithm
# Reader writer pointers
# If reader encounters non-duplicate, increment writer. As soon as reader encounters duplicate, increment reader until reader val is not the same as writer, and change the value of writer.next
# Then reassing writer to reader and increment reader
# go until reader is nil





#First Version
# Nested while loop and nested conditional expression ( 2 while loops two conditionals)
def delete_duplicates(head)
  return head if head.nil?
  return head if head.next.nil?
  n = head.next
  current = head
  ending = false
  
  while !n.nil? do
    if current.val == n.val
      while current.val == n.val do
        if n.next.nil? && n.val == current.val
          current.next = nil
          ending = true
          break
        end
         n = n.next
      end
      current.next = n unless ending
    end
    current = n
    n = n.next
  end
  head
end


# Refactored Version
# Single while loop single conditional structure
def delete_duplicates(head)
  return head if head.nil?
  return head if head.next.nil?
  n = head.next
  current = head
  
  while n != nil do
    if current.val == n.val
      n = n.next
      current.next = n
    else
      current = n
      n = n.next
    end
  end
  head
end