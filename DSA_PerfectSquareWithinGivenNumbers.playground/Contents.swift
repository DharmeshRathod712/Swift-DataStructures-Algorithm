import UIKit

//Number of perfect squares between two given numbers
func perfectSquare(a: Int, b: Int) -> Int {
    let A: Double = Double(a)
    let B: Double = Double(b)
    print("\(sqrt(B)) and \(sqrt(A))")
    return Int(floor(sqrt(B)) - ceil(sqrt(A)) + 1)
}

//perfectSquare(a: 3, b: 8)

func perfectSquare2(a: Int, b: Int) -> Int {
    
    var cntr = 0
    for itm in a...b {
        var j = 1
        while (j*j) <= itm {
            if j*j == itm {
                cntr += 1
            }
            j += 1
        }
    }
    
    return cntr
}

perfectSquare2(a: 9, b: 25)
