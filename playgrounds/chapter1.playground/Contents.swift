import UIKit

// The Basics

// let 상수
// var 변수

// 타입 명시
var message: String
var increment: Int
var doubleNumber: Double

// 출력
print("something")

increment = 1
print(increment)
// int + double 불가
// 정수 -> 소수 자동 형변환 안됨

let three: Int = 3
let underPoint: Double = 0.14
let pi = Double(three) + underPoint
// 정수 -> 소수 강제 형변환 후 연산 가능

message = "Hello World"
print("The most basic sentence for programming : \(message)")
// 문자열이랑 변수 같이 출력할때는 \(변수)

var hello = "Hello"
var world = "World"
print(hello + world)
// 문자열 + 문자열 가능

print(hello < world)
// 문자열 부등호 비교 가능

let error = (404, "Not Found")
error.0
let (statusCode, statusMessage) = error
statusCode
// Tuple 은 여러 자료형을 한꺼번에 묶을 수 있음
// 하나씩 꺼낼때는 .index
// 구조분해할당 처럼 할당가능

let newError = (statusCode: 400, statusMessage: "Error What?")
newError.statusMessage
// key 를 붙여줄 수도 있음

let possibleNumber = "123"
let convertedNumber: Int? = Int(possibleNumber)
convertedNumber
// 123 과 같은 string 은 int 로 변환되지만
// hello 와 같은 string 은 변환안됨
// 실패할 수 있는 경우에 Int? 사용해서 성공하면 int, 아니면 nil

var optionalString: String?
// optional 로 선언된 값에 초기화를 시켜주지 않으면 nil 저장됨

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}

// possibleNumber 에 nil 이 아닌 값이 들어있다면
// actualNumber 라는 변수에 값을 넣어 조건문 안에서 사용할 수 있음
// 하지만 nil 이라면 actualNumber 는 만들어지지 않음

let possibleString: String? = "optional string"
let forceString: String = possibleString!
// if let 등 구문 사용하지 않고 바로 접근하기 위해 ! 사용 (명시적 optional)
// ! 를 붙인 optional 은 처음 정의된 후에는 값이 존재한다고 봄

let assumedString: String! = "unwrapped optional string"
let implicitString: String = assumedString
// runtime 오류를 방지하기 위해 이와 같이 사용

// error handling
func canThrowError() throws {
    // 에러가 날수도 있고, 안날수도 있음
}

do {
    try canThrowError()
    // 메소드에서 에러가 없으면 진행
} catch {
    // 에러 생기면 catch
}

// assertions, preconditions
// 조건이 false 로 나오면 프로그램 종료
// assertion -> debug / precondition -> debug, production

let age = -3
assert(age < 0, "age can't be less than 0")
// 조건 확인 후 종료, 에러 적어두면 출력됨

precondition(age < 0, "age > 0")
// 조건이 거짓이 될 가능성이 있지만 코드가 실행되기 위해선 반드시 참이어야 할 때
