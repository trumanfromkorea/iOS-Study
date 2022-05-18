//
//  ViewController.swift
//  MyTimer
//
//  Created by 장재훈 on 2022/05/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!

    @IBOutlet var startButton: UIButton!
    @IBOutlet var endButton: UIButton!

    var timer: Timer?
    var seconds: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTappedStartButton(_ sender: Any) {
        if let newTimer = timer {
            if newTimer.isValid {
                stopTimer()
            } else {
                startTimer()
            }
        } else {
            startTimer()
        }
    }
    @IBAction func onTappedStopButton(_ sender: Any) {
        stopTimer()
        seconds = 0
        setTimeLabel()
    }
    
    @objc func onTimeFires() {
        seconds += 1

        setTimeLabel()
    }

    func stopTimer() {
        setButtonImage("play")
        timer?.invalidate()
    }

    func startTimer() {
        setButtonImage("pause")
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimeFires), userInfo: nil, repeats: true)
    }

    func setButtonImage(_ state: String) {
        startButton.setImage(UIImage(systemName: "\(state).fill"), for: .normal)
    }

    func setTimeLabel() {
        var newSeconds = seconds

        let hour = newSeconds / 3600
        newSeconds %= 3600
        let min = newSeconds / 60
        let sec = newSeconds % 60

        timerLabel.text = pan(hour) + ":" + pan(min) + ":" + pan(sec)
    }

    func pan(_ time: Int) -> String {
        return time < 10 ? "0\(time)" : "\(time)"
    }
}
