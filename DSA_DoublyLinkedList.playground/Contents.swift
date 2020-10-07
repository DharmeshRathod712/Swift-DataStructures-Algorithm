import UIKit

public class Node<Element> {
    var value: Element
    var previous: Node<Element>?
    var next: Node<Element>?
    
    init(value: Element, prev: Node<Element>?, next: Node<Element>?) {
        self.value = value
        self.previous = prev
        self.next = next
    }
}

class DoublyLinkedList<Element> {
    var head: Node<Element>?
    weak var tail: Node<Element>?
    
    var size = 0
    
    var first: Node<Element>? {
        return head
    }
    
    var last: Node<Element>? {
        return tail
    }
    
    var isEmpty: Bool {
        return sizeOfList() == 0
    }
    
    func sizeOfList() -> Int {
        return size
    }
    
    func addFirst(value: Element) {
        if isEmpty {
            let newNode = Node(value: value, prev: nil, next: nil)
            (head, tail) = (newNode, newNode)
        } else {
            head?.previous = Node(value: value, prev: nil, next: head)
            head = head?.previous
        }
        size += 1
    }
    
    func removeFirst() -> Element? {
        if sizeOfList() == 0 {
            fatalError("Error")
        }
        
        let data = head?.value
        head = head?.next
        
        size -= 1
        
        if sizeOfList() == 0 {
            tail = nil
        } else {
            head?.previous = nil
        }
        
        return data
    }
    
    func removeLast() -> Element? {
        if sizeOfList() == 0 {
            fatalError("Error")
        }
        
        let data = tail?.value
        tail = tail?.previous
        
        size -= 1
        
        if sizeOfList() == 0 {
            head = nil
        } else {
            tail?.next = nil
        }
        
        return data
    }
    
    func remove(index: Int) -> Element? {
        if index < 0 && index > sizeOfList() {
            fatalError("Error")
        }
        
        if index == 0 {
            removeFirst()
        }
        
        if index == sizeOfList() {
            removeLast()
        }
        
        var tempNode: Node<Element>?
        
        if index < sizeOfList()/2 {
            tempNode = head
            var i = 0
            
            while i != index {
                tempNode = tempNode?.next
                i += 1
            }
            
            tempNode?.previous?.next = tempNode?.next
            tempNode?.next?.previous = tempNode?.previous
            
        } else {
            tempNode = tail
            var i = sizeOfList() - 1
            while i != index {
                tempNode = tempNode?.previous
                i -= 1
            }
        }
        let data = tempNode?.value
        tempNode = nil
        tempNode?.next = nil
        tempNode?.previous = nil
        
        size -= 1
        
        return data
    }
    
    func addLast(value: Element) {
        if isEmpty {
            let newNode = Node(value: value, prev: nil, next: nil)
            (head, tail) = (newNode, newNode)
        } else {
            tail?.next = Node(value: value, prev: tail, next: nil)
            tail = tail?.next
        }
        size += 1
    }
    
    func add(value: Element, at index: Int) {
        
        if index < 0 {
            fatalError("Error")
        }
        
        if index == 0 {
            addFirst(value: value)
        }
        
        if index == sizeOfList() {
            addLast(value: value)
        }
        
        var temp = head
        
        for _ in 0..<index-1 {
            temp = temp?.next
        }
        
        let newNode = Node(value: value, prev: temp, next: temp?.next)
        
        temp?.next?.previous = newNode
        temp?.next = newNode
        
        size += 1
    }
    
    
    func printList() {
        var temp = head
        for _ in 0..<size {
            print("Doubly Link List item is: \(temp?.value as? Int ?? 0)")
            temp = temp?.next
        }
        temp = nil
    }
}

let doub = DoublyLinkedList<Int>()
doub.addFirst(value: 4)
doub.addFirst(value: 2)
doub.addLast(value: 7)
doub.addFirst(value: 6)


doub.add(value: 2, at: 2)

doub.sizeOfList()

doub.remove(index: 2)

//doub.sizeOfList()

//doub.removeFirst()
//doub.removeLast()

//doub.sizeOfList()



doub.printList()
