//
//  StopTimerViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/09.
//

import UIKit

class StopTimerViewController: UIViewController {
    static let identifier = "StopTimerViewController"
    static let storyboard = "StopTimerView"

    @IBOutlet var studyContentsTextView: UITextField!
    @IBOutlet var fromListButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureStates()
    }

    @IBAction func onTappedFromList(_ sender: Any) {
    }

    @IBAction func onTappedDoneButton(_ sender: Any) {
        let viewControllers: [UIViewController] = navigationController!.viewControllers as [UIViewController]

        navigationController?.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }

    private func configureStates() {
        navigationItem.hidesBackButton = true

        fromListButton.layer.cornerRadius = 15
        fromListButton.backgroundColor = Theme.supplementColor2.withAlphaComponent(0.5)
        fromListButton.titleLabel?.textColor = Theme.mainColor
        fromListButton.tintColor = Theme.mainColor
    }
}
