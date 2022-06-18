//
//  CircularProgressBarView.swift
//  CircluarProgressBar
//
//  Created by 장재훈 on 2022/06/19.
//

import UIKit

class CircularProgressBarView: UIView {
    // MARK: - Properties -

    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)

    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }

    func createCircularPath() {

        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.type = .conic
        gradient.colors = [UIColor.blue, .systemPink, UIColor.purple, .systemBlue, .blue].map(\.cgColor)
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        let endY = 0.5 + frame.size.width / frame.size.height / 2
        gradient.endPoint = CGPoint(x: 1, y: endY)

        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0),
            radius: frame.size.width / 2 - 70, startAngle: startPoint,
            endAngle: endPoint, clockwise: true
        )

        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath

        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 25.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.black.cgColor

        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        layer.addSublayer(gradient)

        // progressLayer path defined to circularPath
        progressLayer.path = circularPath.cgPath

        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 15.0
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.green.cgColor

        // added progressLayer to layer
        layer.addSublayer(progressLayer)

        gradient.mask = progressLayer
    }

    func progressAnimation(duration: TimeInterval) {
        // created circularProgressAnimation with keyPath
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        // set the end time
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = 1.0
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
