//
//  ViewController.swift
//  CircluarProgressBar
//
//  Created by 장재훈 on 2022/06/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var animatedCountingLabel: UILabel!

    var circularProgressBarView: CircularProgressBarView!
    var circularViewDuration: TimeInterval = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCircularProgressBarView()
    }

    func setUpCircularProgressBarView() {
        // set view
        circularProgressBarView = CircularProgressBarView(frame: self.view.frame)
        // align to the center of the screen
        circularProgressBarView.center = view.center
        // call the animation with circularViewDuration
        circularProgressBarView.progressAnimation(duration: circularViewDuration)
        // add this view to the view controller
        view.addSubview(circularProgressBarView)
    }
}
