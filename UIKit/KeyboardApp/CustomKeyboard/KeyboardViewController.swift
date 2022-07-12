//
//  KeyboardViewController.swift
//  MyKeyboard
//
//  Created by 장재훈 on 2022/07/12.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    var nextKeyboardButton: KeyboardButton!
    var spaceButton: KeyboardButton!
    var shiftButton: KeyboardButton!
    var returnButton: KeyboardButton!
    var deleteButton: KeyboardButton!

    var line1Buttons: [KeyboardButton]!
    var line2Buttons: [KeyboardButton]!
    var line3Buttons: [KeyboardButton]!

    var shiftButtonSelected = false {
        didSet {
            onTappedShiftButton()
        }
    }

    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        line1Buttons = createCharacterButtons(kind: .line1)
        line2Buttons = createCharacterButtons(kind: .line2)
        line3Buttons = createCharacterButtons(kind: .line3)

        nextKeyboardButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        spaceButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        shiftButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        returnButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        deleteButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

        nextKeyboardButton.setTitle(text: "", for: .normal)
        shiftButton.setTitle(text: "⇧", for: .normal)
        deleteButton.setTitle(text: "Del", for: .normal)
        spaceButton.setTitle(text: "Space", for: .normal)

        nextKeyboardButton.button.setImage(UIImage(named: "NextKeyboard"), for: .normal)
        deleteButton.button.setImage(UIImage(named: "Backspace"), for: .normal)

        setButtonsLayout()
        addButtonHandler()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        nextKeyboardButton.isHidden = !needsInputModeSwitchKey
        setReturnKeyType()
        let backgroundColor = UIColor(named: "Background")
        view.backgroundColor = backgroundColor
    }

    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func setButtonsLayout() {
        let charLine1StackView = createCharLineStackView(buttons: line1Buttons)
        let charLine2StackView = createCharLineStackView(buttons: line2Buttons)
        let charLine3StackView = createCharLineStackView(buttons: line3Buttons)

        let addedFuncKeyLine3Stack = UIStackView(arrangedSubviews: [shiftButton, charLine3StackView, deleteButton])
        addedFuncKeyLine3Stack.alignment = .fill
        addedFuncKeyLine3Stack.axis = .horizontal
        addedFuncKeyLine3Stack.distribution = .fill
        addedFuncKeyLine3Stack.spacing = 16
        addedFuncKeyLine3Stack.translatesAutoresizingMaskIntoConstraints = false

        let funcLineStackView = UIStackView(arrangedSubviews: [nextKeyboardButton, spaceButton, returnButton])
        funcLineStackView.alignment = .fill
        funcLineStackView.axis = .horizontal
        funcLineStackView.distribution = .fill
        funcLineStackView.spacing = 4
        funcLineStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(charLine1StackView)
        view.addSubview(charLine2StackView)
        view.addSubview(addedFuncKeyLine3Stack)
        view.addSubview(funcLineStackView)

        let safeGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            charLine1StackView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 4),
            charLine1StackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            charLine1StackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            charLine1StackView.heightAnchor.constraint(equalToConstant: 45),

            charLine2StackView.topAnchor.constraint(equalTo: charLine1StackView.bottomAnchor, constant: 10),
            charLine2StackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 24),
            charLine2StackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -24),
            charLine2StackView.heightAnchor.constraint(equalToConstant: 45),

            shiftButton.widthAnchor.constraint(equalToConstant: 45),
            deleteButton.widthAnchor.constraint(equalToConstant: 45),

            addedFuncKeyLine3Stack.topAnchor.constraint(equalTo: charLine2StackView.bottomAnchor, constant: 10),
            addedFuncKeyLine3Stack.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            addedFuncKeyLine3Stack.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            addedFuncKeyLine3Stack.heightAnchor.constraint(equalToConstant: 45),

            nextKeyboardButton.widthAnchor.constraint(equalToConstant: 40),
            nextKeyboardButton.heightAnchor.constraint(equalToConstant: 45),
            returnButton.widthAnchor.constraint(equalToConstant: 92),

            funcLineStackView.topAnchor.constraint(equalTo: addedFuncKeyLine3Stack.bottomAnchor, constant: 10),
            funcLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            funcLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            funcLineStackView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
        ])
    }

    func setReturnKeyType(type: UIReturnKeyType? = UIReturnKeyType.default) {
        let KeyData = KeyData.KeyboardTypeString

        switch type {
        case .continue:
            returnButton.setTitle(text: KeyData[.continue], for: .normal)
        case .default:
            returnButton.setTitle(text: KeyData[.default], for: .normal)
        case .done:
            returnButton.setTitle(text: KeyData[.done], for: .normal)
        case .emergencyCall:
            returnButton.setTitle(text: KeyData[.emergencyCall], for: .normal)
        case .go:
            returnButton.setTitle(text: KeyData[.go], for: .normal)
        case .google:
            returnButton.setTitle(text: KeyData[.google], for: .normal)
        case .join:
            returnButton.setTitle(text: KeyData[.join], for: .normal)
        case .next:
            returnButton.setTitle(text: KeyData[.next], for: .normal)
        case .route:
            returnButton.setTitle(text: KeyData[.route], for: .normal)
        case .search:
            returnButton.setTitle(text: KeyData[.search], for: .normal)
        case .send:
            returnButton.setTitle(text: KeyData[.send], for: .normal)
        case .yahoo:
            returnButton.setTitle(text: KeyData[.yahoo], for: .normal)
        default:
            returnButton.setTitle(text: KeyData[.default], for: .normal)
        }
    }

    func createCharLineStackView(buttons: [KeyboardButton]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }

    func createCharacterButtons(kind: KeyData.ButtonLine) -> [KeyboardButton] {
        var buttons = [KeyboardButton]()

        let lineText = KeyData.getLineText(buttonType: kind)

        if lineText.count > 3 {
            let generalText = lineText

            for i in 0 ..< generalText.count {
                let key = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                key.setTitle(text: generalText[i], for: .normal)
                key.button.addTarget(self, action: #selector(touchUpChartacterKey(_:)), for: .touchUpInside)

                var tagValue = 0

                switch kind {
                case .line1: tagValue += 100
                case .line2: tagValue += 200
                case .line3: tagValue += 300
                }
                tagValue += i
                key.button.tag = tagValue
                buttons.append(key)
            }
        }
        return buttons
    }

    func onTappedShiftButton() {
        if shiftButtonSelected {
            for key in line1Buttons {
                let character = key.getTitle()
                switch character {
                case "ㅂ":
                    key.button.setTitle("ㅃ", for: .normal)
                case "ㅈ":
                    key.button.setTitle("ㅉ", for: .normal)
                case "ㄷ":
                    key.button.setTitle("ㄸ", for: .normal)
                case "ㄱ":
                    key.button.setTitle("ㄲ", for: .normal)
                case "ㅅ":
                    key.button.setTitle("ㅆ", for: .normal)
                case "ㅐ":
                    key.button.setTitle("ㅒ", for: .normal)
                case "ㅔ":
                    key.button.setTitle("ㅖ", for: .normal)
                default: break
                }
            }

        } else {
            for key in line1Buttons {
                let character = key.getTitle()
                switch character {
                case "ㅃ":
                    key.button.setTitle("ㅂ", for: .normal)
                case "ㅉ":
                    key.button.setTitle("ㅈ", for: .normal)
                case "ㄸ":
                    key.button.setTitle("ㄷ", for: .normal)
                case "ㄲ":
                    key.button.setTitle("ㄱ", for: .normal)
                case "ㅆ":
                    key.button.setTitle("ㅅ", for: .normal)
                case "ㅒ":
                    key.button.setTitle("ㅐ", for: .normal)
                case "ㅖ":
                    key.button.setTitle("ㅔ", for: .normal)
                default: break
                }
            }
        }
    }
}

// MARK: - Button Handler

extension KeyboardViewController {
    private func addButtonHandler() {
        nextKeyboardButton.button.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        shiftButton.button.addTarget(self, action: #selector(touchUpShiftKey), for: .touchUpInside)
        deleteButton.button.addTarget(self, action: #selector(touchUpDeleteKey), for: .touchUpInside)
        spaceButton.button.addTarget(self, action: #selector(touchUpSpaceKey), for: .touchUpInside)
        returnButton.button.addTarget(self, action: #selector(touchUpReturnKey(_:)), for: .touchUpInside)
    }

    // shift 선택되어있으면 정상상태로 되돌리기
    private func setShiftButtonNormal() {
        if shiftButtonSelected {
            shiftButtonSelected = false
        }
    }

    @objc private func touchUpChartacterKey(_ sender: DKey) {
        // insertCharacter
        if let character = sender.titleLabel?.text {
            UIDevice.current.playInputClick()
            textDocumentProxy.insertText(character)
        }
        setShiftButtonNormal()
    }

    @objc private func touchUpSpaceKey() {
        textDocumentProxy.insertText(" ")
        UIDevice.current.playInputClick()
        setShiftButtonNormal()
    }

    @objc private func touchUpReturnKey(_ sender: DKey) {
        textDocumentProxy.insertText("\n")
        UIDevice.current.playInputClick()
        setShiftButtonNormal()
    }

    @objc private func touchUpDeleteKey() {
        deleteCharacterBeforeCursor()
        setShiftButtonNormal()
    }

    @objc private func touchUpShiftKey() {
        UIDevice.current.playInputClick()
        shiftButtonSelected.toggle()
    }

    @objc private func deleteCharacterBeforeCursor() {
        textDocumentProxy.deleteBackward()
        UIDevice.current.playInputClick()
    }
}
