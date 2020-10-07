import UIKit

/**
    - Binary Tree has ATMOST 2 child nodes
    - balanced BST has below Time complexity
        - Insert O(log N)
        - Delete O(log N)
        - Search O(log N)
        - Find Min O(log N)
        - Find Max O(log N)
        - Get all elements in sorted order - InOrder Traversal O(N)
        - Find an element closest in value to x O(log n)
 */

class BinaryNode<Element> {
    var value: Element
    var leftNode: BinaryNode?
    var rightNode: BinaryNode?

    init(_ value: Element) {
        self.value = value
    }
}

//Create a Tree

var tree: BinaryNode<String> = {
    let beverage = BinaryNode("Beverage")
    let hotDrinks = BinaryNode("HotDrinks")
    let coldDrinks = BinaryNode("ColdDrinks")

    let hotLeft = BinaryNode("HotChocolate")
    let hotRight = BinaryNode("Tea")

    let coldLeft = BinaryNode("CocaCola")
    let coldRight = BinaryNode("Pepsi")

    beverage.leftNode = hotDrinks
    beverage.rightNode = coldDrinks

    hotDrinks.leftNode = hotLeft
    hotDrinks.rightNode = hotRight

    coldDrinks.leftNode = coldLeft
    coldDrinks.rightNode = coldRight

    return beverage
}()

extension BinaryNode {
    //InOrder also called as Depth First. First look at the left child of a node, then at the node itself, and finally at its right child
    func traverseInOrder(visit: (Element) -> Void) {
        leftNode?.traverseInOrder(visit: visit)
        visit(value)
        rightNode?.traverseInOrder(visit: visit)
    }
    
    //PreOrder: First look at a node(parent), then at its left and right children
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftNode?.traversePreOrder(visit: visit)
        rightNode?.traversePreOrder(visit: visit)
    }
    
    //PostOrder: First look at the left and right children and process the node(Parent) itself last
    func traversePostOrder(visit: (Element) -> Void) {
        leftNode?.traversePostOrder(visit: visit)
        rightNode?.traversePostOrder(visit: visit)
        visit(value)
    }
}

var testArray: [String] = []

func testInOrder() {
    testArray = []
    tree.traverseInOrder { testArray.append($0) }
    print("Inorder Traversal: == \(testArray)")
}

func testPreOrder() {
    testArray = []
    tree.traversePreOrder { testArray.append($0) }
    print("PreOrder Traversal: == \(testArray)")
}

func testPostOrder() {
    testArray = []
    tree.traversePostOrder{ testArray.append($0) }
    print("PostOrder Traversal: == \(testArray)")
}

testInOrder()
testPreOrder()
testPostOrder()
