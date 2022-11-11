//
//  ViewController.swift
//  MyFirstRx
//
//  Created by 장재훈 on 2022/10/26.
//

import RxCocoa
import RxSwift
import UIKit

class ViewController: UIViewController {
    private var viewModel: ViewModel?

    @IBOutlet var idField: UITextField!
    @IBOutlet var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ViewModel(
            id: idField.rx.controlEvent(.editingChanged)
                .asObservable()
                .compactMap { self.idField.text },
            password: passwordField.rx.controlEvent(.editingChanged)
                .asObservable()
                .compactMap { self.passwordField.text }
        )
    }

    @IBAction func buttonTapped(_ sender: Any) {
        viewModel?.buttonTapped()
    }
}

class ViewModel {
    let disposeBag = DisposeBag()

    var id: Observable<String>
    var password: Observable<String>

    init(id: Observable<String>, password: Observable<String>) {
        self.id = id
        self.password = password

        bind()
    }

    func buttonTapped() {
        
    }

    private func bind() {
//        id.subscribe(onNext: {
//            print("id: ", $0)
//        })
//        .disposed(by: disposeBag)
//
//        password.subscribe(onNext: {
//            print("pw: ", $0)
//        })
//        .disposed(by: disposeBag)
        
        Observable.combineLatest(id, password)
            .subscribe(onNext: { print(">> \($0) \($1)")})
            .disposed(by: disposeBag)
    }
}

class Model {
}
