//
//  ViewController.swift
//  MyTimer
//
//  Created by 장재훈 on 2022/05/18.
//

import CoreMotion
import UIKit

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!

    @IBOutlet var startButton: UIButton!
    @IBOutlet var endButton: UIButton!

    var timer: Timer?
    var seconds: Int = 0

    var motionManager = CMMotionManager()

    var currentMaxAccelX: Double = 0
    var currentMaxAccelY: Double = 0
    var currentMaxAccelZ: Double = 0

    var currentMaxRotX: Double = 0
    var currentMaxRotY: Double = 0
    var currentMaxRotZ: Double = 0

    override func viewDidLoad() {
        initMotionManager()
        super.viewDidLoad()
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

    // MARK: - Timer

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

    // MARK: - Motion

    func initMotionManager() {
//        resetMaxValue()

        // interval 설정
        print("initmotion")
        motionManager.accelerometerUpdateInterval = 5
        motionManager.gyroUpdateInterval = 5

        // 수집 시작
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { accelerometerData, error in

            self.outputAcceleratoinData(accelerometerData!.acceleration)
            if error != nil {
                print("\(error!)")
            }
        }

        motionManager.startGyroUpdates(to: OperationQueue.current!) { gyroData, error in
            self.outputRotationData(gyroData!.rotationRate)
            if error != nil {
                print("\(error!)")
            }
        }
    }

    func outputAcceleratoinData(_ acceleration: CMAcceleration) {
        print("accelX : \(acceleration.x)")
        if fabs(acceleration.x) > fabs(currentMaxAccelX) {
            currentMaxAccelX = acceleration.x
        }
        print("accelY : \(acceleration.y)")
        if fabs(acceleration.y) > fabs(currentMaxAccelY) {
            currentMaxAccelY = acceleration.y
        }
        print("accelZ : \(acceleration.z)")
        if fabs(acceleration.z) > fabs(currentMaxAccelZ) {
            currentMaxAccelZ = acceleration.z
        }

        print("current Max Accel")
        print(currentMaxAccelX)
        print(currentMaxAccelY)
        print(currentMaxAccelZ)
    }

    func outputRotationData(_ rotation: CMRotationRate) {
        print("rotX : \(rotation.x)")
        if fabs(rotation.x) > fabs(currentMaxRotX) {
            currentMaxRotX = rotation.x
        }
        print("rotY : \(rotation.y)")
        if fabs(rotation.y) > fabs(currentMaxRotY) {
            currentMaxRotY = rotation.y
        }
        print("rotZ : \(rotation.z)")
        if fabs(rotation.z) > fabs(currentMaxRotZ) {
            currentMaxRotZ = rotation.z
        }

        print("current Max Rot")
        print(currentMaxRotX)
        print(currentMaxRotY)
        print(currentMaxRotZ)
    }
}
