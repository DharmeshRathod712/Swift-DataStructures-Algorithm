import UIKit

/*
 - Selection Sort
 - The Selection sort algorithm is based on the idea of finding the minimum or maximum element in an unsorted array and then putting it in its correct position in a sorted array.
 - TimeComplexity:- O(N^2)
 - SpaceComplexity:- O(1)
 - This Algo uses Minimum number of swaps
 */

var arr: [Int] = [5, 2, 6, -1, 2, 1, 0, 3]

func selectionSort<T: Comparable>(_ array: inout [T]) {
    for i in 0..<array.count-1 {
        var minIndex = i
        for j in i+1..<array.count {
            if array[minIndex] > array[j] {
                minIndex = j
            }
        }
        (array[minIndex], array[i]) = (array[i], array[minIndex])
    }
    print(array)
}

selectionSort(&arr)
