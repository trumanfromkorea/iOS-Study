//
//  TimerViewController.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/07.
//

import UIKit

class TimerViewController: UIViewController {
    static let identifier = "TimerViewController"
    static let storyboard = "TimerView"

    var timer: Timer?
    var seconds: Int = 0

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTappedPlayPauseButton(_ sender: Any) {
        if let newTimer = timer {
            if newTimer.isValid {
                stopTimer()
            } else {
                startTimer()
            }
        } else {
            print("tapped!")
            startTimer()
        }
    }

    @IBAction func onTappedStopButton(_ sender: Any) {
        stopTimer()
        seconds = 0
        setTimeLabel()
    }

    func startTimer() {
        playPauseButton.setTitle("Pause", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimeFires), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        playPauseButton.setTitle("Play", for: .normal)
        timer?.invalidate()
    }

    @objc func onTimeFires() {
        seconds += 1
        setTimeLabel()
    }

    func setTimeLabel() {

        let min = seconds / 60
        let sec = seconds % 60

        timerLabel.text = getDigits(min) + ":" + getDigits(sec)
    }

    func getDigits(_ time: Int) -> String {
        return time < 10 ? "0\(time)" : "\(time)"
    }
}
