import UIKit

indirect enum Node<T>: Sequence {
    case value(element: T, nextNode: Node<T>)
    case end
}

extension Node {
    func makeIterator() -> LinkdListIterator<T> {
        return LinkdListIterator(trav: self)
    }
}

struct LinkdListIterator<T>: IteratorProtocol {
    var trav: Node<T>
    
    mutating func next() -> T? {
        switch trav {
        case let .value(element, nextNode):
            trav = nextNode
            return element
        case .end:
            return nil
        }
    }
}
