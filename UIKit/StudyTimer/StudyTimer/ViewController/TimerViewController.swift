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

    let enabledButtonColor = Theme.mainColor
    let disabledButtonColor = Theme.supplementColor2

    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var playPauseButton: UIButton!
    @IBOutlet var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        configureButtonState()
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
        stopAlert()
    }

    func configureButtonState() {
        playPauseButton.layer.cornerRadius = 15
        stopButton.layer.cornerRadius = 15

        playPauseButton.backgroundColor = enabledButtonColor
        stopButton.backgroundColor = disabledButtonColor
    }

    func startTimer() {
        navigationItem.hidesBackButton = true

        playPauseButton.setTitle("Pause", for: .normal)
        playPauseButton.backgroundColor = enabledButtonColor

        stopButton.backgroundColor = enabledButtonColor

        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onTimeFires), userInfo: nil, repeats: true)
    }

    func stopTimer() {
        playPauseButton.setTitle("Play", for: .normal)
        playPauseButton.backgroundColor = enabledButtonColor

        stopButton.backgroundColor = disabledButtonColor

        timer?.invalidate()
    }

    func stopAlert() {
        let sheet = UIAlertController(title: "정지", message: "정말 정지하시겠습니까?", preferredStyle: .alert)
        sheet.addAction(UIAlertAction(title: "아니오", style: .default))
        sheet.addAction(UIAlertAction(title: "예", style: .default, handler: { _ in
            self.stopTimer()
            self.seconds = 0
            self.setTimeLabel()
            
            self.navigateStopTimerView()
        }))

        present(sheet, animated: true)
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
    
    func navigateStopTimerView() {
        let storyboard = UIStoryboard(name: TimerViewController.storyboard, bundle: nil)

        let vc = storyboard.instantiateViewController(withIdentifier: StopTimerViewController.identifier) as! StopTimerViewController

        navigationController?.pushViewController(vc, animated: true)
    }
}
