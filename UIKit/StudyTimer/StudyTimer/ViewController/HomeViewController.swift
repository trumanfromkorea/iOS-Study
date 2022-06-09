//
//  HomeViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/08.
//

import UIKit

class HomeViewController: UIViewController {
    static let identifier = "HomeViewController"
    static let storyboard = "HomeView"

    @IBOutlet var studyTimeView: UIView!
    @IBOutlet var weeklyView: UIView!
    @IBOutlet var calendarView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        studyTimeView.layer.cornerRadius = 10
        weeklyView.layer.cornerRadius = 10
        calendarView.layer.cornerRadius = 10
    }
}
