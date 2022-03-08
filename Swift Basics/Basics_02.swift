import UIKit


// MARK: - struct

/*
 생성자를 만들지 않아도 됨 알아서 만들어줌
 call by value
 */
struct Person {
    var name: String
    var age: Int
}

var me: Person = Person(name: "재훈", age: 25)

var meClone: Person = me
meClone.name = "jaehoon"

// 값 복사이기 때문에 둘의 값이 다름
print(me.name) // -> 재훈
print(meClone.name) // -> jaehoon

// MARK: - class

// 생성자 필요
// call by reference
class Device {
    var name: String
    var version: Int
    
    init(name: String, version: Int) {
        self.name = name
        self.version = version
    }
}

var phone: Device = Device(name: "iphone", version: 13)

print(phone.name) // -> iphone

// 메모리 참조 형태이기 때문에 둘다 값이 바뀜
var phoneClone: Device = phone
phoneClone.name = "iphone pro"

print(phone.name) // -> iphone pro
print(phoneClone.name) // -> iphone pro
