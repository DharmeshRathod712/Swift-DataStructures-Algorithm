import UIKit

/**
 - Reverse a given Integer number
*/

func reverseInt(vale: Int) {
    var input = vale
    var output = 0

    while input != 0 {
        output = output * 10 + input % 10
        print("result: \(output)")
        input = input / 10
        print("temp: \(input)")
    }

    print(output)

}
reverseInt(vale: 1234)
