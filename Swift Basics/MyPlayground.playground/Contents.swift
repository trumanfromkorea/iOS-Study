import UIKit

// MARK: - 조건문

var isDarkMode: Bool = false

// if - else
if isDarkMode {
    print("Dark Mode")
} else {
    print("Light Mode")
}

// 삼항연산자
var label: String = isDarkMode ? "Dark Mode" : "Light Mode"

// MARK: - 반복문

var myArray: [Int] = [0, 1, 2, 3, 4, 5, 7, 8, 9]

// foreach
for item in myArray {
    print(item)
}

// 조건 추가
for item in myArray where item % 2 == 0 {
    print("짝수 : \(item)")
}

// 범위
for i in 0 ... 5 {
    print(i)
}

/*
 0 ... 5 --> 0,1,2,3,4,5
 0 ..< 5 --> 0,1,2,3,4
 */

// MARK: - 열거형

// 한줄에 다 써도 되고 나눠서 써도 된다
enum School {
    case elementary, middle, high, university
}

let mySchool: School = School.university

// 타입을 지정하여 값을 가질 수 있다
enum Grade: Int {
    case first = 1
    case second = 2
    case third = 3
}

let myGrade: Grade = Grade.second
print("my grade is \(myGrade.rawValue)") // 값 출력 -> 2

enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)

    func get() -> String {
        switch self {
        case let .elementary(name):
            return name
        case let .middle(name):
            return name
        }
    }
}

let mySchoolName = SchoolDetail.middle(name: "중학교")
print(mySchoolName.get()) // 인자로 넣어준 문자열 출력 -> 중학교
