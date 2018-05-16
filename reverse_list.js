function ListNode(val) {
      this.val = val;
      this.next = null;
}


function reverseList(head) {
 if (!head){return null};
 if (!head.next){return head};
  
 let prev = head;
 let curr = head.next;
 let next = curr.next;
 prev.next = null; // removes circular list
  
 while (next) {
   curr.next = prev;
   prev = curr;
   curr = next;
   next = next.next
 }
  curr.next = prev; // points the final node towards prev
  return curr;
}

function iterateThrough(head){
 
 let curr = head;
  
 while (curr !== null) {
  console.log(curr.val)
  curr = curr.next
 }
}

let head = new ListNode(1);
let two = new ListNode(2);
let three = new ListNode(3);
let four = new ListNode(4);

head.next = two;
two.next = three;
three.next = four;
four.next = null;

iterateThrough(head); // 1 2 3 4
head = reverseList(head) 
iterateThrough(head) // 4 3 2 1
