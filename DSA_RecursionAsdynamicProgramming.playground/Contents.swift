import UIKit

/**
    - Recusrion means functions calling itself. It is part of Dynamic Programming. Recursion in addition with memoization speed up the recursion process
        - Appreoach - Check for Optimal Sub solutions and then check for overlapping sub problems
    - TimeComplexity:- O(N) i.e linear time
    - SpaceComplexity:- O(N) as all the recursive functions are stored in a stack memory
    - For smaller Input size you can use Recursion or else go for Iteration
    - TimeComplexity for Recursive Fibonaci: O(2^N) i.e exponential time
 */

let knownFibonacciValues: [Int] = [ 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811 ]

func factorial(_ value: Int) -> Int {
    if value == 0 {
        return 1
    } else {
        return value * factorial(value - 1)
    }
}

//factorial(5)

var memoized: [Int: Int] = [:]

//Recursive Fibonaci series with memoization
func fibonaciSeriesRecursive(_ uptoNumber: Int) -> Int {
    
    if let fibonacci = memoized[uptoNumber] {
        return fibonacci
    }
    
    guard uptoNumber >= 2 else {
        memoized[uptoNumber] = uptoNumber
        return uptoNumber
    }
    
    let fibonacci = fibonaciSeriesRecursive(uptoNumber - 1) + fibonaciSeriesRecursive(uptoNumber - 2)
    memoized[uptoNumber] = fibonacci
    
    return fibonacci
}

fibonaciSeriesRecursive(2)

// Iterative Fibonaci series
func fibonaciSeries(_ uptoNumber: Int) -> Int {
    if uptoNumber <= 1 {
        return uptoNumber
    } else {
        var val1 = 0
        var val2 = 1
        var res = 0
        
        for _ in 1..<uptoNumber {
            res = val1 + val2
            val1 = val2
            val2 = res
        }
        
        return res
    }
}

//fibonaciSeries(6)
