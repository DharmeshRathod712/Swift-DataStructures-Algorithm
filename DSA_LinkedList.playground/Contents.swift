import UIKit

public class Node<Element> {
    var value: Element
    var next: Node<Element>?
    
    init(value: Element) {
        self.value = value
    }
}

class SinglyLinkedList<Element> {
    var head: Node<Element>?
    
    var size = 0
    
    var first: Node<Element>? {
        return head
    }
    
    // Or check size == 0
    var isEmpty: Bool {
        return head == nil
    }
    
    func append(value: Element) {
        let newNode = Node(value: value)
        
        // If list is empty then make new node as head node
        if isEmpty {
            head = newNode
        } else if var temp = head {// else iterate over each next elemnt until you find nil
            while temp.next != nil {
                temp = temp.next!
            }
            temp.next = newNode
        }
        size += 1
    }
    
    func addFirst(value: Element) {
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
        } else {
            newNode.next = head
            head = newNode
        }
        size += 1
    }
    
    func removeFirst() -> Element? {
        let data = head?.value
        
        if isEmpty {
            return nil
        } else {
            head = head?.next
        }
        
        size -= 1
        
        return data
    }
    
    func removeLast() -> Element? {

        var temp = head
        var data: Element?
        if isEmpty {
            return nil
        } else {
            while temp?.next != nil {
                temp = temp?.next
            }
            
            data = temp?.value
            
            if temp == nil || temp?.next == nil {
                return data
            }
            
            temp?.next = nil
        }
        
        size -= 1
        
        return data
    }
    
    func addLast(value: Element) {// This is Similar to append
        let newNode = Node(value: value)
        
        if isEmpty {
            head = newNode
        } else {
            var temp = head
            while temp?.next != nil {
                temp = temp?.next
            }
            temp?.next = newNode
        }
        
        size += 1
    }
    
    func insert(value: Element, at Position: Int) {
        
        if Position < 0 {
            fatalError("Invalid Position")
        }
        
        let newNode = Node(value: value)
        
        if Position == 0 {
            self.addFirst(value: value)
        } else if Position == size {
            self.addLast(value: value)
        } else {
            var previous = head
            var current = head
            
            for _ in 0..<Position {
                previous = current
                current = current?.next
            }
            
            newNode.next = previous?.next
            previous?.next = newNode
        }
        
        size += 1
    }
    
    func deleteNode(at Position: Int) {
        
        if Position < 0 {
            fatalError("Invalid Position")
        }
        
        if isEmpty {
            return
        }
        
        var temp = head
        
        if Position == 0 {// or call remove first
            head = temp?.next
            return
        }
        
        for _ in 0..<Position-1 where temp != nil {
            temp = temp?.next
        }
        
        if temp == nil || temp?.next == nil {
            return
        }
        
        temp?.next = temp?.next?.next
        
        size -= 1
    }
    
    func reverseLinkedList() {
        var current = head
        var prev: Node<Element>? = nil
        var next: Node<Element>? = nil
        
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        head = prev
        
        prev = nil
        next = nil
        current?.next = nil
        current = nil
    }
    
    func reverseLLRecusion(head: Node<Element>?) {
        
        if head == nil {
            self.head = head
            return
        }
        reverseLLRecusion(head: head?.next)
        let temp = head?.next
        temp?.next = head
        head?.next = nil
    }
    
    func prinList() {
        var temp = head
        
        while temp != nil {
            print("Singly Link List item is: \(temp?.value as? Int ?? 0)")
            temp = temp?.next
        }
    }
}
    
// Test Case

let singlyLL = SinglyLinkedList<Int>()

singlyLL.append(value: 1)
singlyLL.append(value: 2)
singlyLL.append(value: 4)

singlyLL.addLast(value: 0)
singlyLL.addFirst(value: -1)
singlyLL.removeFirst()
singlyLL.removeLast()
//singlyLL.prinList()



//singlyLL.insert(value: 3, at: 2)
//singlyLL.insert(value: 5, at: 4)
//singlyLL.deleteNode(at: 4)
singlyLL.prinList()

singlyLL.reverseLinkedList()

singlyLL.prinList()
