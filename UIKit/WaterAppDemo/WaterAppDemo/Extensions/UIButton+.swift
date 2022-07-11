//
//  UIButton+.swift
//  WaterAppDemo
//
//  Created by 장재훈 on 2022/07/10.
//

import Foundation
import UIKit

extension UIButton {
    // 버튼 이미지 크기 조절
    func setImage(systemName: String, state: UIControl.State) {
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill

        imageView?.contentMode = .scaleAspectFit

        setImage(UIImage(systemName: systemName), for: state)
    }
}

