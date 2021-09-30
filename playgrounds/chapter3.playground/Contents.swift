// Strings and Characters

import UIKit

let someString = "Some string"
let quotation = """

안녕하세요 제 이름은 장재훈입니다.
영어로는 여러 줄에 거쳐 글을 쓰기가 어렵네요.
내일 하루도 화이팅 합시다!

"""
// '' 는 string 에서 쓸수가 없음
// 여러 줄에 거쳐서 쓸때는 """
// 이 때 개행은 \ 를 추가해주자
// 시작과 마지막 줄은 빈 칸으로 해두는게 좋음

/*
 특수문자

 \0 -> 널문자
 \\ -> back 슬래시를 문자열에서 사용할 때
 \t -> tab
 \n -> 개행
 \r -> carriage return (커서를 맨 처음위치로 보내기)
 \" -> 문자열에서 큰 따옴표
 \' -> 문자열에서 작은 따옴표
 \u{n} -> 유니코드, n 은 1~8 자리의 16진수

 */

let text1 = #"Line 1 \nLine 2"# // Line 1 \nLine 2
let text2 = #"Line 1 \#nLine 2"# // Line 1 (개행)Line 2

var emptyString = ""
var anotherEmptyString = String()
// 빈 문자열을 만드는 두 가지 방법

print(emptyString.isEmpty)
// string 에는 isEmpty 가 있다

/*
 string 은 var 변수로 선언하면 수정, + 연산 등이 가능하지만
 let 상수로 선언하면 불가능하다

 swift 의 string 은 value 타입이고
 새로운 string 값을 만들어내면 그 값이 메소드에 사용될 때 복사되어 사용된다(새로운 값이 만들어지는 것)
 */

for character in "Hello" {
    print(character)
}

let characters: [Character] = ["H", "E", "L", "L", "O"]
let newString = String(characters)
print(newString)
// 반복문을 돌리면 한글자씩 출력
// [Character] 배열로 만들면 string 으로 만들수도 있음

// +, += 연산자를 이용해 문자열을 서로 합칠 수 있고
let dot = "."
var sentence = "Hello"
sentence.append(dot)
print(sentence)
// append() 를 사용할 수 있다
// let 에는 사용하지 않도록 주의하자
// 한 문자는 되도록 Character 타입 명시를 해주자

let countMessage = "abcdefghijklmnop"
print(countMessage.count)
// NSString 의 length 프로퍼티와는 동일하지 않을 수 있다고 한다
// -> 뭔지 알아보자

let greeting = "Welcome to Playground!"

greeting[greeting.startIndex] // W
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // e

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // 빈칸, 7번째 칸 (6번째 인덱스)

for idx in greeting.indices {
    print(greeting[idx])
}

// indices 프로퍼티를 통해 문자열의 모든 인덱스에 접근할 수 있다
// python 의 enumerate 와 비슷한 것 같다

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// remove 도 index 접근은 똑같다
// 특정 범위를 지우고 싶다면 removeSubrange(_:) 메소드를 이용할 수 있다.

let subStringTest = "Hello, World!"
let subIndex = subStringTest.firstIndex(of: ",") ?? greeting.endIndex // ?? 는 nil 검사하는 연산자
let beginning = subStringTest[..<subIndex]
let subString = String(beginning)
/*
 substring 또한 메모리를 가지게 되지만
 기존의 string 이 사용하고 있던 메모리를 재사용하거나
 다른 substring 이 사용하는 메모리를 사용할 수 있다
 그래서 새로운 string 으로 재생성 해주는 것 같다
 -> 더 자세하게 찾아보기
 */

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        print(scene)
    }
}
// 접두사 확인
// 접미사는 hasSuffix
