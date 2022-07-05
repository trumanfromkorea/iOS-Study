import UIKit


// MARK: - Delegate Pattern
protocol WorkDelegate {
    func someTask()
}

class Director {
    var delegate: WorkDelegate?

    func someTask() {
        delegate?.someTask()
    }
}

class Worker: WorkDelegate {
    func someTask() {
        print("일하는 중...")
    }
}

let director = Director()
director.delegate = Worker()
director.someTask()

// MARK: - Params

func someFunction(number: Int, label: String) {
    // code
    print(number, label)
}
someFunction(number: 1, label: "hello")

func increment(_ value: Int) -> Int {
    return value + 1
}
increment(5)
