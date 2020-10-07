import UIKit

/**
 Problem Statement: - Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target
 Constraints: -
 - You may assume that each input would have exactly one solution, and you may not use the same element twice.
 - You can return the answer in any order.
 */

var arr = [1,2,4,4].sorted() //[1,2,3,9]
let sum = 8

// TimeComplexity: O(N)
func sumOfTwo(arr: [Int], sum: Int) -> [Int] {
    var tempDic: [Int: Int] = [:]

    for (indx, item) in arr.enumerated() {
        let diff = sum - item
        if let diffIndex = tempDic[diff] {
            return [diffIndex, indx]
        }

        tempDic[item] = indx
    }

    return []
}
sumOfTwo(arr: arr, sum: sum)

// TimeComplexity: O(NLogN) it can return only one pair from array. Also for this approach Array need to be sorted
func sumOfTwo2(arr: [Int], sum: Int) -> [Int] {
    var leftIndx = 0
    var rightIndx = arr.count - 1

    while leftIndx < rightIndx {
        let leftEle = arr[leftIndx]
        let rightEle = arr[rightIndx]
        let sumValue = leftEle + rightEle

        if sumValue == sum {
            print("LeftElement: == \(leftEle) and RightElement: == \(rightEle)")
            return [leftIndx, rightIndx]
        } else if sumValue < sum {
            leftIndx += 1
        } else {
            rightIndx -= 1
        }
    }
    
    return []
}
sumOfTwo2(arr: arr, sum: sum)
