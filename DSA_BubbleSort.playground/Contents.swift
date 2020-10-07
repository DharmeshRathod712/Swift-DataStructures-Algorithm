import UIKit

/*
 - In Buuble sort we try to keep the heavier element at the end and lighter element at the begining
 - TimeComplexity:-
    - WorstCase:- O(N^2)
    - BestCase: - O(N)
 */

var arr: [Int] = [2,4,3,1,0]//[3,4,5,1,0,8,1]

func bubbleSort() {
    for _ in 0..<arr.count {
        for j in 1..<arr.count {
            if arr[j - 1] > arr[j] {
                (arr[j - 1], arr[j]) = (arr[j], arr[j - 1])
            }
        }
    }
    print(arr)
}

bubbleSort()
