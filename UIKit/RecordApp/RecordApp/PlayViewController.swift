//
//  PlayViewController.swift
//  RecordApp
//
//  Created by 장재훈 on 2022/06/27.
//

import UIKit

class PlayViewController: UIViewController {
    
    static let identifier = "PlayViewController"
    static let storyboard = "Main"
    
    var audioFile: AudioCellItem!
    var fileName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fileName = "\(audioFile.title)+\(audioFile.duration).m4a"
        print(fileName)
    }
    
}
