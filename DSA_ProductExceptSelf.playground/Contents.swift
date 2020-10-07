import UIKit

/**
 Problem: - Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i]
 Constraint:- It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
 */

func productOFArrayExceptSelf(_ nums: [Int]) -> [Int] {
    var arrOutput = Array(repeating: 1, count: nums.count)
    
    if nums.isEmpty {
        return arrOutput
    }
    
    var index = 1
    while index < nums.count {
        arrOutput[index] = arrOutput[index - 1] * nums[index - 1]
        index += 1
    }
    
    index = nums.count - 1
    
    var rightEle = 1
    while index >= 0 {
        arrOutput[index] = arrOutput[index] * rightEle
        rightEle = nums[index] * rightEle
        index -= 1
    }
    
    return arrOutput
}

productOFArrayExceptSelf([1,2,3,4])
