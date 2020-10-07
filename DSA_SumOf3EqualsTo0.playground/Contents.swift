import UIKit

/**
 Problem: - Given an array of N integers find the 3 integers which gives sum equals 0
*/

let nums = [-1, 0, 1, 2, -1, -4]

var tempArr: [[Int]] = []

for i in 0..<nums.count {
    for j in i+1..<nums.count {
        for k in j+1..<nums.count {
            if (nums[i] + nums[j] + nums[k]) == 0 {
                tempArr.append([nums[i],nums[j],nums[k]])
            }
        }
    }
}
