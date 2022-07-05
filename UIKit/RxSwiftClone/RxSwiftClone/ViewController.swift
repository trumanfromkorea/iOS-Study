//
//  ViewController.swift
//  RxSwiftClone
//
//  Created by 장재훈 on 2022/07/05.
//

import UIKit
import RxSwift
import RxCocoa

class MyObservable<T> {
    private var _task: ((@escaping (T) -> Void) -> Void)?

    init(task: @escaping (_ execute: @escaping (T) -> Void) -> Void) {
        _task = task
    }

    func subscribe(_ execute: @escaping (T) -> Void) {
        guard let task = _task else { return }
        DispatchQueue.global(qos: .background).async {
            task(execute)
        }
    }
}

extension MyObservable {
    static func create(_ task: @escaping (_ execute: @escaping (T) -> Void) -> Void) -> MyObservable<T> {
        return MyObservable(task: task) // 생성자 대신 호출
    }
}

// value 만 넣어주면 전달해주는
extension MyObservable {
    static func just(_ value: T) -> MyObservable<T> {
        return MyObservable<T> { receiver in
            receiver(value)
        }
    }
}

extension MyObservable {
    static func from(_ value: [T]) -> MyObservable<T> {
        return MyObservable<T> { receiver in
            value.forEach { t in
                receiver(t)
            }
        }
    }
}

// 새로 생성되서 나가야 하니 return 할때 새로 메소드 생성?
extension MyObservable {
    func map<U>(_ mapper: @escaping (T) -> U) -> MyObservable<U> {
        return MyObservable<U> { receiver in
            self.subscribe { t in
                receiver(mapper(t))
            }
        }
    }
}

extension MyObservable {
    func filter(_ filter: @escaping (T) -> Bool) -> MyObservable<T> {
        return MyObservable<T> { receiver in
            self.subscribe { t in
                if filter(t) { // filtering
                    receiver(t)
                }
            }
        }
    }
}

extension MyObservable {
    func filterNil<U>() -> MyObservable<U> where T == U? {
        return filter { $0 != nil }.map { $0! }
    }
}

// T -> U 가 아니라 T -> MyObservable<U> ...?
extension MyObservable {
    func flatMap<U>(_ mapper: @escaping (T) -> MyObservable<U>) -> MyObservable<U> {
        return MyObservable<U> { receiver in
            self.subscribe { t in
                mapper(t).subscribe { u in
                    receiver(u)
                }
            }
        }
    }
}

extension MyObservable {
    func main() -> MyObservable<T> {
        return MyObservable<T> { receiver in
            self.subscribe { t in
                DispatchQueue.main.async {
                    receiver(t)
                }
            }
        }
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

//        i2s(42) {
//            print($0)
//        }

        // execute 부분이 task 의 callback 으로 들어감
//        generalAsyncFunction(
//            task: { cb in
//                cb("\(42)")
//            },
//            execute: { s in
//                print(s)
//            }
//        )

//        MyObservable
//            .create { cb in
//                cb("\(42)")
//            }
//            .subscribe { s in
//                print(s)
//            }

//        MyObservable
//            .just("\(42)")
//            .subscribe { s in
//                print(s)
//            }

        MyObservable
            .from([41, 42, 43])
            .filter { i in
                i % 2 == 0
            }
            .flatMap(i2s(_:))
            .subscribe { s in
                print(s)
            }
    }

//    func i2s(_ i: Int, _ cb: @escaping (String) -> Void) {
//        DispatchQueue.global(qos: .background).async {
//            cb("\(i)")
//        }
//    }

    func i2s(_ i: Int) -> MyObservable<String> {
        return MyObservable.create { task in
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
                task("\(i)")
            }
        }
    }

//    func asyncImageDownload(_ url: URL) -> MyObservable<UIImage?> {
//
//    }

    // execute type 과 task 의 인자 타입이 같음
    // 함수가 1개 -> 1차함수
    // 함수가 여러개 -> 고차함수 higher order function
    // task 도 함수를 인자로 받아서 고차함수임!
    func generalAsyncFunction<T>(
        task: @escaping (_ result: @escaping (T) -> Void) -> Void,
        execute: @escaping (T) -> Void
    ) {
        DispatchQueue.global(qos: .background).async {
            task(execute)
        }
    }
}
