import UIKit

/**
    - Min Heap
        Parent has lesser value then left child and then Right child. So basically Parent has lesser value then  it's child node
    - So  root node has smallest value in Min Heap
 */

class MinHeap {
    var items:[Int] = []
    
    //Get Index
    func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return (2 * parentIndex) + 1
    }
    
    func getRightChildIndex(_ parentIndex: Int) -> Int {
        return (2 * parentIndex) + 2
    }
    
    func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    // Boolean Check
    func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    
    func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    
    func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }
    
    // Return Item From Heap
    func leftChildValue(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }
    
    func rightChildValue(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }
    
    func parentValue(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }
    
    
    func swapValues(_ index1: Int, _ index2: Int) {
        (items[index1] , items[index2]) = (items[index2] , items[index1])
    }

    func peek() -> Int? {
        return items.first
    }
    
    // Extracts Minimum Element i.e Root Element and Remove from the array
    func poll() -> Int? {
        if items.isEmpty {
            print("No Element")
            return nil
        }
        
        let rootvalue = items.first
        items[0] = items[items.count - 1]
        items.removeLast()
        heapifyDown()
        
        return rootvalue
    }
    
    func removeAt(index: Int) -> Int? {
        if items.isEmpty {
            print("No Element")
            return nil
        }
        
        let value = items[index]
        items[index] = items[items.count - 1]
        items.removeLast()
        heapifyDown()
        
        return value
    }
    
    func addItem(item: Int) {
        items.append(item)
        heapifyUp()
    }
    
    func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parentValue(index) > items[index] {
            swapValues(getParentIndex(index), index)
            index = getParentIndex(index)
        }
    }
    
    func heapifyDown() {
        var index = 0
        // Check if there is left child, because if no left child then certainly no right child is there
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChildValue(index) < leftChildValue(index) {
                smallerChildIndex = getRightChildIndex(index)
            }
            
            if items[index] < items[smallerChildIndex] {
                break
            } else {
                swapValues(index, smallerChildIndex)
            }
            
             index = smallerChildIndex
        }
    }
    
    func printHeap() {
        for item in items {
            print("Heap Items \(item)")
        }
    }
}

let myHeap = MinHeap()
myHeap.poll()
myHeap.peek()

myHeap.addItem(item: 2)
myHeap.addItem(item: 10)
myHeap.addItem(item: 8)
myHeap.addItem(item: 9)
myHeap.addItem(item: 7)
myHeap.addItem(item: 3)
myHeap.addItem(item: 4)


myHeap.printHeap()

myHeap.removeAt(index: 3)

//myHeap.poll()
myHeap.printHeap()
