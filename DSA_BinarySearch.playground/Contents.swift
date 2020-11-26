import UIKit

/*
 - Binary Search
    RandomAccessCollection (This protocol requires that Collection can perform index manipulation in constant time) i.e. O(1)
 - STEPS:
    1) Take the middle elemnt of given collection and compare the search element with it if found then return
    2) Or else If value of middle element is less then search element then discard mid and left elements and perform the step 1 on all right side elements or else search on all the elements on left side 
    3) Repeat it till you find the element or return nil to represnt element not found
 - Binary Search works best with base condition
    *** Already Sorted
 - TimeComplexity:- O(LogN)
 */

let array = [4,2,6,3,9].sorted()

// Binary Search with Recursive Way with RandomAccessCollection Protocol
extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else { return nil}
        
        let size = (distance(from: range.lowerBound, to: range.upperBound))
        let mid = index(range.lowerBound, offsetBy: size / 2)
        
        if self[mid] == value {
            return mid
        } else if self[mid] > value {
            return binarySearch(for: value, in: range.lowerBound..<mid)
        } else {
            return binarySearch(for: value, in: index(after: mid)..<range.upperBound)
        }
    }
}
//array.binarySearch(for: 9)

// Binary Search with Iterative Way
func binarySearch2<T: Comparable>(for array: [T], lowerBound: Int, upperBound: Int ,element: T) -> Int? {
    var lowerBound = lowerBound//0
    var upperBound = upperBound//array.count
    
    while lowerBound < upperBound {
        let mid = lowerBound + (upperBound - lowerBound) / 2
        
        if array[mid] == element {
            return mid
        } else if array[mid] < element {
            lowerBound = mid + 1
        } else {
            upperBound = mid
        }
    }
    return nil
}
//binarySearch2(for: array, element: 9)

// Binary Search with Recursive Way WITHOUT RandomAccessCollection Protocol
func binarySearch3<T: Comparable>(for array: [T], element: T, range: Range<Int>) -> Int? {
    
    guard range.lowerBound < range.upperBound else { return nil}
    
    let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if array[mid] == element {
        return mid
    } else if array[mid] < element {
        return binarySearch3(for: array, element: element, range: mid+1..<range.upperBound)
    } else {
        return binarySearch3(for: array, element: element, range: range.lowerBound..<mid)
    }
}

binarySearch3(for: array, element: 5, range: 0..<array.count)

var ar = [0,2,1,3,6,4,9,7,8]

let temp = ar.sorted(by: >)
print(temp)

ar.map { (a) -> String in
    return String(a)
}

ar.filter { (a) -> Bool in
    return a % 2 == 0
}

ar.reduce("") { (r, a) -> String in
    print("r: == \(r)")
    print("a: == \(a)")
    return r + String(a)
}
