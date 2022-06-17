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

        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationItem.hidesBackButton = true
        
        configureTouchEvents()
    }
//
//    private func addNaviBar() {
//
//        // safe area
//        var statusBarHeight: CGFloat = 0
//        statusBarHeight = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
//
//        // navigationBar
//        let naviBar = UINavigationBar(frame: .init(x: 0, y: statusBarHeight, width: view.frame.width, height: statusBarHeight))
//        naviBar.isTranslucent = false
//        naviBar.backgroundColor = .systemBackground
//
//        let naviItem = UINavigationItem(title: "title")
//        naviItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapDoneButton))
//        naviBar.items = [naviItem]
//
//        view.addSubview(naviBar)
//    }
//    @objc func didTapDoneButton() {
//        print("hello")
//    }

    private func configureTouchEvents() {
        let studyViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapStudyView))
        let weeklyViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapWeeklyView))
        let calendarViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapCalendarView))

        studyTimeView.addGestureRecognizer(studyViewTapGesture)
        weeklyView.addGestureRecognizer(weeklyViewTapGesture)
        calendarView.addGestureRecognizer(calendarViewTapGesture)
    }

    @objc private func handleTapStudyView() {
        let storyboard = UIStoryboard(name: TimerViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: TimerViewController.identifier) as! TimerViewController
        vc.title = "Timer"

        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func handleTapWeeklyView() {
        let storyboard = UIStoryboard(name: WeeklyViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: WeeklyViewController.identifier) as! WeeklyViewController

        vc.title = "Weekly View"

        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func handleTapCalendarView() {
        let storyboard = UIStoryboard(name: CalendarViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: CalendarViewController.identifier) as! CalendarViewController

        vc.title = "Calendar View"

        navigationController?.pushViewController(vc, animated: true)
    }
}
