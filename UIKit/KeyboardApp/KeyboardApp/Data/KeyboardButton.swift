//
//  KeyboardButton.swift
//  CustomKeyboard
//
//  Created by 장재훈 on 2022/07/12.
//

import Foundation
import UIKit

class DKey: UIButton {
    private var optionText: String = ""
    func setOptionText(_ text: String?) {
        optionText = text ?? ""
    }

    func getOptionText() -> String {
        return optionText
    }
}

class KeyboardButton: UIView {
    // var defaultBackgroundColor: UIColor = .white
    // var highlightBackgroundColor: UIColor = .lightGray

    var buttonTextColor = UIColor.label
    var buttonBackgroundColor = UIColor.systemBackground
    var buttonHighlightColor = UIColor.secondarySystemBackground

    lazy var button: DKey = {
        let btn = DKey(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()

    lazy var optionLabel: UILabel = {
        let optionLabel = UILabel()
        optionLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        optionLabel.text = ""
        optionLabel.textAlignment = .right
        optionLabel.translatesAutoresizingMaskIntoConstraints = false
        return optionLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override class var requiresConstraintBasedLayout: Bool {
        return true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = buttonBackgroundColor
        button.setTitleColor(buttonTextColor, for: .normal)
        button.tintColor = buttonTextColor
    }

    private func setupView() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 0.0
        layer.shadowOpacity = 0.35

        addSubview(optionLabel)
        addSubview(button)
        button.setTitleColor(buttonTextColor, for: .normal)
        button.tintColor = buttonTextColor
        setupLayout()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(equalTo: topAnchor),
            optionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            optionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            optionLabel.heightAnchor.constraint(equalToConstant: 20),

            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setOptionTitle(_ text: String) {
        optionLabel.text = text
        button.setOptionText(text)
    }

    func setTitle(text: String?, for state: UIControl.State) {
        DispatchQueue.main.async {
            self.button.setTitle(text, for: state)
        }
    }

    func getTitle() -> String {
        return button.titleLabel?.text ?? ""
    }

    func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        button.setTitleColor(color, for: .normal)
    }
}

extension UIInputView: UIInputViewAudioFeedback {
    public var enableInputClicksWhenVisible: Bool {
        return true
    }
}
