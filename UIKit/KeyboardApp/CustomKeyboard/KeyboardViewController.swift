//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by 장재훈 on 2022/07/11.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    @IBOutlet var nextKeyboardButton: UIButton!

    var morseKeyboardView: MorseKeyboardView!

    override func updateViewConstraints() {
        super.updateViewConstraints()

        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: MorseKeyboardView.identifier, bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)

        morseKeyboardView = objects.first as! MorseKeyboardView

        guard let inputView = inputView else {
            return
        }
        inputView.addSubview(morseKeyboardView)

        // --

        morseKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            morseKeyboardView.leftAnchor.constraint(equalTo: inputView.leftAnchor),
            morseKeyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            morseKeyboardView.rightAnchor.constraint(equalTo: inputView.rightAnchor),
            morseKeyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
        ])

        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)

        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false

        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)

        self.view.addSubview(self.nextKeyboardButton)

        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        morseKeyboardView.setNextKeyboardVisible(needsInputModeSwitchKey)
    }

    override func viewWillLayoutSubviews() {
        nextKeyboardButton.isHidden = !needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }

    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.

        var textColor: UIColor
        let proxy = textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        nextKeyboardButton.setTitleColor(textColor, for: [])
    }
}
