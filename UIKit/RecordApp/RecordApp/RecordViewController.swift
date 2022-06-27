//
//  RecordViewController.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import AVFoundation
import FirebaseStorage
import UIKit

class RecordViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate {
    static let identifier = "RecordViewController"
    static let storyboard = "Main"

    @IBOutlet var recordButton: UIButton!
    @IBOutlet var playButton: UIButton!

    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!

    var fileName: String = ""
    var audioFile: URL!
    var audioPlayer: AVAudioPlayer!

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

    @IBAction func onTappedRecordButton(_ sender: Any) {
        if audioRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }

    @IBAction func onTappedPlayButton(_ sender: Any) {
        initPlayer()
        audioPlayer.play()
    }

    @IBAction func onTappedUploadButton(_ sender: Any) {
        uploadFile()
    }

    private func initRecordSession() {
        recordingSession = AVAudioSession.sharedInstance()

        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)

            recordingSession.requestRecordPermission { allowed in
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

    private func initPlayer() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error {
            print("init player error \(error)")
        }

        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
    }

    private func startRecording() {
        fileName = dateFormatter.string(from: Date())
        audioFile = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

            recordButton.setImage(UIImage(systemName: "stop.fill"), for: .normal)

        } catch {
            finishRecording(success: false)
        }
    }

    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    private func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            initPlayer()
            fileName += "+\(Int(audioPlayer.duration))"
            print("success")
        } else {
            print("failed")
        }

        recordButton.setImage(UIImage(systemName: "record.circle.fill"), for: .normal)
    }

    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }

    private func uploadFile() {
        let storage = Storage.storage()
        let storageRef = storage.reference()

        let audioRef = storageRef.child("audio/\(fileName).m4a")

        do {
            let data = try Data(contentsOf: audioFile)

            // upload task_
            audioRef.putData(data, metadata: nil) { metadata, _ in
                guard metadata != nil else {
                    print("metadata failed")
                    return
                }

//                audioRef.downloadURL { url, _ in
//                    guard let downloadURL = url else {
//                        print("download failed")
//                        return
//                    }
//
//                    print("\(downloadURL)")
//                }
            }
        } catch {
            print("no file")
        }
    }
}
