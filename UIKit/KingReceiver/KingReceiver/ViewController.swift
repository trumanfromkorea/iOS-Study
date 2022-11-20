//
//  ViewController.swift
//  KingReceiver
//
//  Created by 장재훈 on 2022/11/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var index = 0
    
    let absoluteURLs: [String] = [
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%81%E1%85%A9%E1%86%BC%E1%84%8E%E1%85%B51.jpeg?alt=media&token=e3889867-486a-4932-a002-818d81e4b6c2",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%81%E1%85%A9%E1%86%BC%E1%84%8E%E1%85%B52.jpeg?alt=media&token=ebc2520b-fcb1-4a75-b106-3c8080894b97",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%81%E1%85%A9%E1%86%BC%E1%84%8E%E1%85%B53.JPG?alt=media&token=7fdba1ea-9de2-4c1d-8f9a-e532238cf88b",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%81%E1%85%A9%E1%86%BC%E1%84%8E%E1%85%B54.JPG?alt=media&token=ef994aa9-f5f0-4929-84f5-5e86dc24ff88",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%83%E1%85%A9%E1%84%8C%E1%85%B51.JPG?alt=media&token=5acc44f6-9e0c-4079-a6bd-da6018635e98",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%83%E1%85%A9%E1%84%8C%E1%85%B52.jpg?alt=media&token=677d61c1-aa80-4c7c-a8d2-a91dcf738ee4",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%83%E1%85%A9%E1%84%8C%E1%85%B53.jpeg?alt=media&token=8d4790e4-692c-478f-9225-227018d11bd8",
        "https://firebasestorage.googleapis.com/v0/b/spacecapsule-5644b.appspot.com/o/%E1%84%83%E1%85%A9%E1%84%8C%E1%85%B54.jpeg?alt=media&token=a00c8f33-9ab7-43f1-a857-312989b42494",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        let url = absoluteURLs[index % 8]
        
        imageView.kr.setImage(
            with: url,
            placeholder: UIImage(systemName: "person"),
            cachePolicy: .disk
        )
        
        index += 1
    }
}
