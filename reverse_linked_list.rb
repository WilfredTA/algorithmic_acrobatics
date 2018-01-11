# O(N) time complexity, O(1) space

def reverse_list(head)
   return nil if head.nil?
   return head if head.next.nil?

   dummy, dummy.next = Node.new(0), head
   prev, curr, n = dummy, head, head.next

   while !n.nil? do
     if n.next
      prev = curr
      curr = n
      n = n.next
      curr.next = prev
     else
       head = n
       n.next = curr
       n = nil
     end
   end

  head
end

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
  end
end


one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)
one.next = two
#two.next = three
#three.next = four
#four.next = five


#p [four.next.val, three.next.val, two.next.val, one.next.val] #expect [5,4,3,2]

p reverse_list(one)
#p [five.next.val, four.next.val, three.next.val, two.next.val] #expect [4,3,2,1]
