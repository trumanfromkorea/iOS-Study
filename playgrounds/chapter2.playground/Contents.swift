// Basic Operators

import UIKit

let b = 10
var a = 5
a = b
// a 를 b 값으로 초기화 혹은 업데이트

let (x, y) = (1, 2)
// 구조분해할당 가능

let three = 3
let minusThree = -three
// 바로 - 를 붙여서 부호를 바꿀 수 있다

var i = 3
i += 1
// i ++ 은 안된다

// swift 의 비교연산자에도 ===, !== 가 존재하는데
// 이는 두 객체 참조가 모두 동일한 인스턴스를 참조하는지를 검사한다.

(1, "zebra") < (2, "apple") // true -> 1 < 2 라서 다음 조건으로 안감
(3, "apple") < (3, "bird") // true -> 3 3 비교 후 apple bird 비교

let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// useDefinedColorName 이 nil 이라서
// "red" 가 colorNameToUse 에 저장됨

for index in 1...5 {
    print(index)
}
// 1 부터 5 까지
// 1..<n 이면 1 부터 n-1 까지

let characters = ["a", "b", "c", "d", "e", "f", "g", "h"]

for char in characters[2...] {
    print(char)
}
// n... 이면 n+1 번째 인덱스부터 증가

for char in characters[...2] {
    print(char)
}
// ...n 이면 n 번째 인덱스까지 증가

let range = ...5
range.contains(7) // false
range.contains(4) // true
range.contains(-1) // true

// 논리 연산자는 && || 동일함
