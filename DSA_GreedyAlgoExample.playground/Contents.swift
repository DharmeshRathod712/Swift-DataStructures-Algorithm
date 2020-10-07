import UIKit

/**
 You are given an array A of integers, where each element indicates the time a thing takes for completion. You want to calculate the maximum number of things that you can do in the limited time (T) that you have.
 
 var A = [5, 3, 4, 2, 1]
 let T = 6
 */

func calculateMaxNumberOfTask(taskList: [Int], maxTimeLimit: Int) -> Int {
    var currentTime = 0
    var totalNumberOfTask = 0
    let tempArr = taskList.sorted()
    
    for item in tempArr {
        if currentTime < maxTimeLimit {
            currentTime += item
            totalNumberOfTask += 1
        }
    }
    
    return totalNumberOfTask
}

calculateMaxNumberOfTask(taskList: [5, 3, 4, 2, 1], maxTimeLimit: 6)
