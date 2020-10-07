import UIKit

/*
    - Quick Sort is a divide and conquer Sorting technique
    - Quick Sort works on the basis of pivot element of the array. Now try to sort all the element greater than pivot element on the right of pivot and place all the element lesser then pivot on the left of pivot.
    - Try same approch for left partisioned array and last partitioned array until you get single elements as sorted individual array
    - TimeComplexity:-
        - Average Case: NLogN
        - Worst Case: O(N^2)
    - SpaceComplexity:- O(1)
    - Most of the Programming languages uses Quick Sort as their sorting algorithm
    - Quick Sort is Recusrsive Sorting Algorith
 */

var numbers = [13, 77, 20, 45, 2, 15, 0, 59, 5, 68, 51, 1, -1, 77]

func quickSort<T: Comparable>(_ array: inout [T], startIndex: Int, endIndex: Int) {
    
    if startIndex >= endIndex { return }
    
    let pivotIndex = pivotFunction(&array, startIndex: startIndex, endIndex: endIndex)
    quickSort(&array, startIndex: startIndex, endIndex: pivotIndex-1)
    quickSort(&array, startIndex: pivotIndex+1, endIndex: endIndex)
}

func pivotFunction<T: Comparable>(_ array: inout [T], startIndex: Int, endIndex: Int) -> Int {
    var pivotIndex = startIndex
    
    for index in startIndex..<endIndex {
        if array[index] < array[endIndex] {
            (array[pivotIndex], array[index]) = (array[index], array[pivotIndex])
            pivotIndex += 1
        }
    }
    
    (array[pivotIndex], array[endIndex]) = (array[endIndex], array[pivotIndex])
    
    return pivotIndex
}


quickSort(&numbers, startIndex: 0, endIndex: numbers.count - 1)
