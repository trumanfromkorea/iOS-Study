//
//  ViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/07.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func navigateTimerView(_ sender: Any) {
        let storyboard = UIStoryboard(name: TimerViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: TimerViewController.identifier) as! TimerViewController
        vc.title = "Timer"

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func navigateHomeView(_ sender: Any) {
        let storyboard = UIStoryboard(name: HomeViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        vc.title = "Home"

        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func navigateWeeklyView(_ sender: Any) {
        let storyboard = UIStoryboard(name: WeeklyViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: WeeklyViewController.identifier) as! WeeklyViewController
        
        vc.title = "Weekly View"

        navigationController?.pushViewController(vc, animated: true)
    }
}
