import UIKit

/*
    - Stack is ADT
    - It is LIFO data type
    - TimeComplexity:
        - Best Case and Average Case: O(1)
        - Worst Case: O(N)
    - Application of Stack
        - Recursion
        - Undo/Redo
        - Balanced Paranthesis
 */

struct Stack<Element: Equatable>: Equatable {
    var data: [Element] = []
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init() {}
    
    init(_ ele: [Element]) {
        data = ele
    }
    
    mutating func pushEle(_ ele: Element) {
        data.append(ele)
    }
    
    @discardableResult//Discards the results
    mutating func popEle() -> Element? {
        return data.popLast()
    }
    
    func peek() -> Element? {
        return data.last
    }
    
    //DO belwo or call peek inside isEmpty varriable
    func isStackEmpty() -> Bool {
        return data.isEmpty ? true : false
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return data
            .map{"\($0)"}
            .joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        data = elements
    }
}

var stack = Stack<Int>()

stack.pushEle(1)
stack.pushEle(2)
stack.pushEle(3)
stack.pushEle(4)

print(stack.description)

stack.popEle()
print("Pop Result: === \(stack.description)")

print("Peek Result: === \(stack.peek())")

print("isEmpty Result: === \(stack.isStackEmpty())")

let stacky: Stack = ["A", "B", "C"]
print(stacky == ["A", "B", "C"])
