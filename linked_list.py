# Value Class, a Node
class Node():
    def __init__(self, value):
        self.next = None
        self.value = value

    # Default string representation
    def __str__(self):
        return f'Value: {self.value=}'

    # debug print
    def pd(self):
        print(str(self))

    # debug print all
    def pdall(self):
        ptr = self
        while ptr:
            ptr.pd()
            ptr = ptr.next

class LinkedList():
    def __init__(self, value=None):
        self.head = Node(value)
        self.ptr = self.head

    def insert(self, value):
        temp = Node(value)
        temp.next = self.head
        self.head = temp

    def delete(self):
        if self.head():
            if self.head.next:
                temp = self.head.next
                self.head = temp
            else:
                self.head = None

    def printlist(self,):
        ptr = self.head
        while ptr:
            ptr.pd()
            ptr = ptr.next

    def find(self, value):
        ptr = self.head
        pos = 0
        while ptr:
            if ptr.value == value:
                return pos
            ptr = ptr.next
            pos += 1
        return False

    def findKth(self, index):
        ptr = self.head
        pos = 0
        while ptr:
            if pos == index:
                return ptr
            ptr = ptr.next
        return False

li = LinkedList(5)
li.head.pd()
li.delete()
print()

li.insert(5)
li.delete()
li.insert(5)
li.insert(7)
li.insert(8)
li.insert(9)
li.printlist()
print()

li.delete()
print(li.find(9))
li.printlist()
print()

li.insert(9)
li.printlist()
print(li.find(9))
print()

print(li.find(5))
print(li.find(7))
print(li.find(8))
print(li.find(13))

print(li.findKth(0))
print(li.findKth(3))
print(li.findKth(2))
print(li.findKth(1))

