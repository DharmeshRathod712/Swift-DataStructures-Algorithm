import UIKit

/**
    - Binary Search tree is a tree Data structure where all the LEFT nodes has value LESSER than it's PARENT node or ROOT node
        and all the RIGHT nodes has value GREATER than it's PARENT node or ROOT node
    - TimeComplexity:
            Insertion - O(N) with ValueTypes like enums and O(Log N) with referance type i.e classes like below
            Traversal - O(N)
 */

class Node<Element> {
    var data: Element
    var leftNode: Node<Element>?
    var rightNode: Node<Element>?
    
    init(data: Element, leftNode: Node<Element>? = nil, rightNode: Node<Element>? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
    
    func minimum() -> Node<Element> {
        var node = self
        while let next = node.leftNode {
            node = next
        }

        return node
    }

    func maximum() -> Node<Element> {
        var node = self

        while let next = node.rightNode {
            node = next
        }

        return node
    }
}

class BinarySearchTree<Element: Comparable> {
    
    private var rootNode: Node<Element>?
    
    func insert(element: Element) {
        let node = Node(data: element)
        
        //Check if rootNode is empty or not. If it is empty then set new node as root node or else call insert function
        if let rootNode = self.rootNode {
            self.insert(rootNode, node)
        } else {
            self.rootNode = node
        }
    }
    
    private func insert(_ rootNode: Node<Element>, _ newNode: Node<Element>) {
        //If root Node data is greater than new Node data then go on left side or else go on right side
        if rootNode.data > newNode.data {
            if let leftNode = rootNode.leftNode {//If root node left child is NOT empty i.e NOT nil then call insert function again with leftchild and new node
                self.insert(leftNode, newNode)
            } else { //If root node left child is empty i.e nil then set the new node as root node's left child
                rootNode.leftNode = newNode
            }
        } else {
            if let rightNode = rootNode.rightNode {//If root node right child is NOT empty i.e NOT nil then call insert function again with right child and new node
                self.insert(rightNode, newNode)
            } else { //If root node right child is empty i.e nil then set the new node as root node's right child
                rootNode.rightNode = newNode
            }
        }
    }
}

//Tree Traversal
extension BinarySearchTree {
    /**
    Binary Trees are travered in TOP to BOTTOM ,  LEFT to RIGHT
     
        - Inorder Traversal: LEFT -> PARENT or ROOT -> RIGHT (InOrder Traversal is also called as Depth First traversal)
        - Pre Order Traversal: PARENT or ROOT -> LEFT -> RIGHT
        - Post Order Traversal: LEFT -> RIGHT -> PARENT or ROOT
     */
    
    func traverse() {
        print("\nPRE-ORDER TRAVERSE")
        self.preorder(self.rootNode)
        print("\n\nIN-ORDER TRAVERSE")
        self.inorder(self.rootNode)
        print("\n\nPOST-ORDER TRAVERSE")
        self.postorder(self.rootNode)
        print("\n")
    }
    
    private func inorder(_ node: Node<Element>?) {
        guard let _ = node else { return }
        
        self.inorder(node?.leftNode)
        print("\(node!.data)", terminator: " ")
        self.inorder(node?.rightNode)
    }
    
    private func preorder(_ node: Node<Element>?) {
        guard let _ = node else { return }
        
        print("\(node!.data)", terminator: " ")
        self.preorder(node?.leftNode)
        self.preorder(node?.rightNode)
    }
    
    private func postorder(_ node: Node<Element>?) {
        guard let _ = node else { return }
        
        self.postorder(node?.leftNode)
        self.postorder(node?.rightNode)
        
        print("\(node!.data)", terminator: " ")
    }
}

// Searching The Node
extension BinarySearchTree {
    
    func search(element: Element) {
        self.search(rootNode, element)
    }
    
    private func search(_ rootNode: Node<Element>?, _ searchElement: Element) {
        guard let rootNode = rootNode else {
            print("INVALID NODE : \(searchElement)")
            return
        }
        
        if searchElement == rootNode.data {
            print("NODE FOUND : \(rootNode.data)")
        } else if searchElement > rootNode.data {
            self.search(rootNode.rightNode, searchElement)
        } else if searchElement < rootNode.data {
            self.search(rootNode.leftNode, searchElement)
        }
    }
    
}

//Deletion of The Node
extension BinarySearchTree {
    
    func delete(element: Element) {
        rootNode = delete(rootNode, element)
    }
    
    private func delete(_ rootNode: Node<Element>?, _ deletionElement: Element) -> Node<Element>? {
        guard let root = rootNode else { return nil }
        
        if deletionElement < root.data {
            root.leftNode = delete(root.leftNode, deletionElement)
        } else if deletionElement > root.data {
            root.rightNode = delete(root.rightNode, deletionElement)
        } else {
            if root.leftNode == nil {
                return root.rightNode
            } else if root.rightNode == nil {
                return root.leftNode
            }
            
            root.data = (minValue(root.rightNode)!)
            root.rightNode = delete(root.rightNode, root.data)
        }
        
        return root
    }
    
    func minValue(_ node: Node<Element>?) -> Element? {
        var tempNode = node
        
        while let next = tempNode?.leftNode {
            tempNode = next
        }
        
        return tempNode?.data
    }
    
}


let tree = BinarySearchTree<String>()

tree.insert(element: "F")
tree.insert(element: "G")
tree.insert(element: "H")
tree.insert(element: "D")
tree.insert(element: "E")
tree.insert(element: "I")
tree.insert(element: "J")
tree.insert(element: "A")
tree.insert(element: "B")
tree.insert(element: "C")

//tree.traverse()


tree.search(element: "E")
tree.search(element: "N")

tree.delete(element: "J")
tree.traverse()
