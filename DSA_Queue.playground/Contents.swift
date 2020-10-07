import UIKit

/*
 - Queue is FIFO DS
 - Real World example is Printer shared over network
 - TimeComplexity:- O(1)
 */
struct Queue<Element: Equatable>: Equatable {
    public private(set) var data: [Element] = []
    
    var isEmptyQueue: Bool {
        return peek() == nil
    }

    mutating func enqueue(newElement: Element) {
        data.append(newElement)
    }

    @discardableResult
    mutating func dequeue() -> Element? {
        guard !data.isEmpty else { return nil }
        return data.remove(at: 0)
    }
    
    func peek() -> Element? {
      return data.first
    }

}

extension Queue {
  func isHomogeneous() -> Bool {
    guard let first = data.first else { return true }
    return !data.contains { $0 != first }
  }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return data
            .map{"\($0)"}
            .joined(separator: " ")
    }
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        data = elements
    }
}

var q = Queue<String>()
q.enqueue(newElement: "5")

q.dequeue()
q.dequeue()

q.isEmptyQueue
