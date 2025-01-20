#Challenge #1 Implement the following API:

  # InsertTail(k): adds k to the end of the list
  # Insert(k): adds k to the start of the list
    # Insert an element at the start of the list. Just create a new element and move references. So that this new element becomes the new element of the list. This operation will take O(1) constant time.
  # Delete(): delete element at the start of the list
    # Delete an element at the start of the list. We just need to move one reference. This operation will also take O(1) constant time.
  # PrintList(): display all the elements of the list.
    # Start with the first element and then follow the references. This operation will take O(N) time.
  # IsEmpty(): check if the number of elements in the list are zero.
    # Just check the head reference of the list it should be Null. Which means list is empty. This operation will take O(1) time.
  # Find(k): find the position of element with value k
    # Start with the first element and follow the reference until we get the value we are looking for or reach the end of the list. This operation will take O(N) time.
  # FindKth(k): find element at position k
    # Start from the first element and follow the links until you reach the kth element. This operation will take O(N) time.

class Node
  attr_accessor :next, :data

  def initialize(dat, ptr = nil)
    @data = dat
    @next = ptr
  end

  # update_ptr can be safely called if an object's nextptr is set to null
  # otherwise this can be called for a temporary object traversing the list, such as an iter
  def update_ptr(ptr)
    @next = ptr
  end
  
  # Append a datum at the end of the list
  def insertTail(data)
    # special case for when the first node is intentionally deleted or never initialized
    if @data == nil then
      @data = data
      return
    end

    tail = Node.new(data, self)
    # statements for debugging
    # p "  self_addr: #{self} self_data: #{@data} self_next: #{@next}"
    # p "  tail_addr: #{tail}"
    # p "  next_data: #{@next.data} next_next: #{@next.next}""
    # p "tail:   #{tail.data}..#{tail.next}"

    # maintains a pointer into the list starting with the first object
    # once we get to the last object in the list, update that obj's pointer.
    while tail.next != nil
      #todo we can remove this jump and roll the statement into one loop, with the update_ptr calls outside the loop
      if tail.next.next == nil
        tail.next.update_ptr(tail)
        tail.update_ptr(nil)
      else
        tail.next = tail.next.next
      end
    end

    # p "tail:   #{tail.data}..#{tail.next}"
  end

  def is_empty()
    return @next ? true : false
  end

  # Inserts a new node at the start of the list
  def insert(data)
    # special case, do not make a new object if the current object is empty
    if @data == nil then
      @data = data
      # I don't think this should be needed if the list struct is used correctly, though there may be a way to add some safety here
      # Actually, #todo, Add an assert here once I figure out how to do qasserts
      # @next = nil
    else
      top = Node.new(@data, @next)
      @data, @next = data, top
    end
  end

  # delete the first item in the list
  def delete()
    @data = @next ? @next.data : nil
    @next = @next ? @next.next : nil
  end

  # moves a list item one element forward to be used with an iterator
  # please clone your object with the clone function as to not lose the pointer to head, see 'print_list' for implementation
  def walk()
    if self.is_empty then
      @data = self.next.data
      @next = self.next.next
      return true
    else
      return false
    end
  end

  # returns the element with value of k
  def find(k)
    iter = self.clone()
    n = 0
    begin
      if iter.data == k then
        return n
      end
      n += 1
    end while iter.walk()
    return nil
  end

  # find element at position n, 0 indexed
  def findKth(n)
    iter = self.clone()
    begin
      n -= 1
    end while n >= 0 and iter.walk()
    return iter.data
  end

  # puts list to standard input
  def print_list()
    iter = self.clone()
    begin
      puts iter.data
    end while iter.walk()
  end

end


########################################################
## TEST CODE
# Please move to TEST FILE
########################################################

d1 = Node.new (5)
puts "#{d1.data}, #{d1.next} ..."
#BUG!! test1 and test2 produce the same output

#test1
d1.delete();           puts "#{d1.data} ... #{d1.next}"
d1.insertTail(5)
d1.delete()
d1.insert(5)
d1.insertTail(7)
d1.insertTail(8)
d1.insertTail(9)


d1.print_list()
puts
puts d1.findKth(0)
puts d1.findKth(1)
puts d1.findKth(2)
puts d1.findKth(3)

#test2
puts puts

d2 = Node.new (0)
d2.delete();           puts "#{d2.data} ... #{d2.next}"
d2.insert(0);         puts "#{d2.data} ... #{d2.next}"
d2.insertTail(0)
d2.insert(12)

iter = d2.clone()
begin
  puts iter.data
end while iter.walk()
d2.print_list()

