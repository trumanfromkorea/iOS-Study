//
//  RecordViewController.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import AVFoundation
import UIKit

class RecordViewController: UIViewController {
    static let identifier = "RecordViewController"
    static let storyboard = "Main"

    @IBOutlet var recordButton: UIButton!

    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "YYYY.MM.dd_HH:mm:ss"
        return formatter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initRecordSession()
    }

    private func initRecordSession() {
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)

            recordingSession.requestRecordPermission { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        print("init record session")
                    } else {
                        print("failed to record")
                    }
                }
            }
        } catch let error {
            print("record session error \(error)")
        }
    }

    private func startRecording() {
        let dateTime = dateFormatter.string(from: Date())
    }
}
