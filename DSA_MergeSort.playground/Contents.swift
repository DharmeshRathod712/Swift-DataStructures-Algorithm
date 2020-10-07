import UIKit

/*
    - Merge Sort works on Divide and Conqure basis, It keeps on spliting the given array until it becomes the size of one by taking the midPoint of an Input array
    - Start compring values of the array with size of 1 and add the lesser value to the new array and return that array
    - Reapeat above second steps for all the splitted array and keep on merging
    - at the end you will get the Final sorted array
    - TimeComplexity:- NLogN
    - SpaceComplexity:- O(N)
*/


var arr: [Int] = [7, 2, 6, 3, 9]

func mergeSort<T: Comparable>(_ inputArr: [T]) -> [T] {
    guard inputArr.count > 0 else { return inputArr }
    
    let mid = (inputArr.count / 2)
    
    let leftArr = mergeSort(Array(inputArr[0..<mid]))
    let rightArr = mergeSort(Array(inputArr[mid..<inputArr.count]))
    
    return merge(leftArr, rightArr)
}

func merge<T: Comparable>(_ arrLeft: [T], _ arrRight: [T]) -> [T] {
    var leftCounter = 0
    var rightCounter = 0
    
    var tempArray: [T] = []
    
    while leftCounter < arrLeft.count && rightCounter < arrRight.count {
        let leftEle = arrLeft[leftCounter]
        let rightEle = arrRight[rightCounter]
        
        if leftEle < rightEle {
            tempArray.append(leftEle)
            leftCounter += 1
        } else if leftEle > rightEle {
            tempArray.append(rightEle)
            rightCounter += 1
        } else {
            tempArray.append(leftEle)
            leftCounter += 1
            tempArray.append(rightEle)
            rightCounter += 1
        }
    }
    
    while leftCounter < arrLeft.count {
        tempArray.append(arrLeft[leftCounter])
        leftCounter += 1
    }
    
    while rightCounter < arrRight.count {
        tempArray.append(arrRight[rightCounter])
        rightCounter += 1
    }
    
    return tempArray
}

mergeSort(arr)
