//
//  ModalViewController.swift
//  DelegatePattern
//
//  Created by 장재훈 on 2022/07/01.
//

import UIKit

class ModalViewController: UIViewController {
    static let identifier = "ModalViewController"
    static let storyboard = "Main"

    var delegate: CodaDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTappedIncrementButton(_ sender: Any) {
        delegate?.increment()
    }
}
