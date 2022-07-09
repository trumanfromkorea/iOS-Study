import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }

// + - * /
var operators = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxVal = Int.min
var minVal = Int.max

calculate(array.first!, 1)

print(maxVal)
print(minVal)

// 메소드 선언
func calculate(_ value: Int, _ index: Int) {
    if index == n {
        maxVal = max(value, maxVal)
        minVal = min(value, minVal)
        return
    }
    
    for i in 0 ..< 4 {
        if operators[i] == 0 {
            continue
        }

        operators[i] -= 1

        var result = value

        switch i {
        case 0:
            result += array[index]
        case 1:
            result -= array[index]
        case 2:
            result *= array[index]
        case 3:
            result /= array[index]
        default:
            break
        }

        calculate(result, index + 1)
        operators[i] += 1
    }
}
