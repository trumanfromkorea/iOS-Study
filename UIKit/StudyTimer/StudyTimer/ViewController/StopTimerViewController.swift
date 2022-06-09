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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
}
