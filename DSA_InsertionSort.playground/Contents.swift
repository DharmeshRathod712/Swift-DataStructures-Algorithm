import UIKit

/*
 - Consider first element as sorted in Insertion Sort and start with position 1, Compare current elemet with previous one and if found greater then swap those element
 - Time complexity:
    Bset Case:- O(N) when array is already sorted
    Worst Case:- O(N^2) i.e n squre
 - Space Complexity:-
    O(1) as only one variable was needed for storing current value
 - Stability of Sort Algo:-
    As we are not swapping the elements with the same value i.e. 6 with 6 because of condition arr[index] > value we can say that alog is stable
 
  ----- If array is partially sorted in that case go for Insertion sort -----
 
 */

var arr: [Int] = [7,6,2,5,-1,0,3,6]

func insertionSort() {
    let arrSize = arr.count
    var i = 1
    while i < arrSize {
        let value = arr[i]
        var index = i - 1
        while index >= 0 && arr[index] > value {
            arr[index + 1] = arr[index]
            index -= 1
        }
        arr[index + 1] = value
        i += 1
    }
}

insertionSort()
print("Result: \(arr)")
