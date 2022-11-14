//
//  UIView+.swift
//  CustomTabBar
//
//  Created by 장재훈 on 2022/11/14.
//

import UIKit

extension UIView {
    func setBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}
