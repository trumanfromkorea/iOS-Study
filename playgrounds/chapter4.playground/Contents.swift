// Collection types

var someInts = [Int]()
print(someInts.count)
// append 로 추가 가능하고
// [] 로 초기화한 후에도 역시 int 형만 담을 수 있음

var threeDoubles = Array(repeating: 0.0, count: 3)
// [0.0, 0.0, 0.0]
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)
// array 끼리 더하면 합쳐짐

var shoppingList: [String] = ["eggs", "milk"]
// 문자열을 담는 array 도 생성 가능

/*
 Array 의 method 와 properties

 .count -> 길이
 .isEmpty -> 공백

 .append() -> 추가
 [n...m] -> range 접근가능

 .insert(item, at: index ) -> index 에 item 추가
 .remove ~~ -> item 삭제
  */

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print(index, value)
}

// for in 구문도 활용 가능하고,
// enumerated() 를 사용해서 인덱스랑 값에 접근 가능

/*
 Set

 Set 은 동일한 타입의 값이 순서 없이 저장됨
 중복 값을 허용하지 않음

 Set 에 저장되기 위해서는 hash
 여기서 해시값은 int 형
 해시는 set 이냐 dictionary 의 키값이 될 수 있음
 */

var letters = Set<Character>()
// 선언

letters.insert("a")
letters = []
// 초기화

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hiphop"]
// 값을 포함한 set 초기화
// var favoriteGenres: Set = [...]
// 이렇게 선언해도 알아서 타입 유추하긴 함

// count, isEmpty 는 동일하고
// insert 나 remove 는 index 가 필요없다
// 모두 제거하려면 removeAll()
// .contains() 를 이용해 특정 값을 포함하는지 검사할 수 있다

for genre in favoriteGenres.sorted() {
    print(genre)
}

// for in 구문을 사용할 수 있고
// 순서가 정의되어 있지 않지만
// sorted() 메소드를 사용할 수 있음

/*
 a.intersection(b) -> 교집합
 a.symmetricDifference(b) -> a-b + b-a
 a.union(b) -> 합집합
 a.substracting(b) -> a-b

 a.isSubset(of: b) -> 부분집합 검사
 a.isSuperset(of: b) -> 상위집합인지 검사
 a.isStrictSubset(of: b) -> 부분집합인지, 상위집합이면서 같은 집합은 아닌지 검사
 a.isDisjoint(with: b) -> 공통으로 가진 원소가 하나도 없는 것인지 검사
 */

var namesOfIntegers = [Int: String]()
// key 값은 int 형
// value 값은 string 형으로 이루어진 딕셔너리

namesOfIntegers[16] = "sixteen"
// 삽입
namesOfIntegers = [:]
// 초기화

var airports: [String: String] = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin",
]
// 중괄호 대신 대괄호를 쓴다 언젠가 한번은 실수할듯

// count 랑 isEmpty 는 동일

// 딕셔너리는 특정한 key 값에 접근할 때
// key 값이 존재하지 않을 수도 있어서 늘 옵셔널로 결과를 준다
// 존재하지 않는 key 값에 접근하면 nil 반환하고
// 옵셔널 바인딩을 통해 value 를 추출해줘야 한다

airports["DUB"] = nil
// 이렇게 존재하는 key 값에 nil 을 집어넣으면
// key value 둘다 삭제하는 셈이다

for (airportCode, airportName) in airports {
    print(airportCode, airportName)
}
// for in 구문 활용 가능,
// key, value 에 할당되는 튜플로 반환됨

for airportCode in airports.keys {
    print(airportCode)
}
// 이처럼 key 값이나 value 값에만 접근할 수도 있음

let airportCodes = [String](airports.keys)
// key, value 를 각각 저장하고 싶으면 새로운 array 생성 가능
// sorted 메소드도 지원한다고 한다
