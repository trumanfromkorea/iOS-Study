//
//  MorseKeyboardView.swift
//  KeyboardApp
//
//  Created by 장재훈 on 2022/07/11.
//

import UIKit
import Foundation

/// Delegate method for the morse keyboard view that will allow it to perform
/// actions on whatever text entry you want to use it with. It does not assume
/// any type e.g. UITextField vs UITextView.
protocol MorseKeyboardViewDelegate: AnyObject {
    func insertCharacter(_ newCharacter: String)
    func deleteCharacterBeforeCursor()
    func characterBeforeCursor() -> String?
}

/// Contains all of the logic for handling button taps and translating that into
/// specific actions on the text entry associated with it
class MorseKeyboardView: UIView {
    static let identifier = "MorseKeyboardView"
    
    @IBOutlet var previewLabel: UILabel!
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var spaceButtonToParentConstraint: NSLayoutConstraint!
    @IBOutlet var spaceButtonToNextKeyboardConstraint: NSLayoutConstraint!

    weak var delegate: MorseKeyboardViewDelegate?

    /// Cache of signal inputs
    var signalCache: [KoreanKey.Signal] = [] {
        didSet {
            var text = ""
            if signalCache.count > 0 {
                text = signalCache.reduce("") {
                    $0 + $1.rawValue
                }
                text += " = \(cacheLetter)"
            }
            print("text >> \(text)")
            previewLabel.text = text
        }
    }

    /// The letter represented by the current signalCache
    var cacheLetter: String {
        return ""
//        return KoreanKey.letter(fromSignals: signalCache) ?? "?"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setColorScheme(.light)
        setNextKeyboardVisible(false)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setColorScheme(.light)
        setNextKeyboardVisible(false)
    }

    func setNextKeyboardVisible(_ visible: Bool) {
        spaceButtonToNextKeyboardConstraint.isActive = visible
        spaceButtonToParentConstraint.isActive = !visible
        nextKeyboardButton.isHidden = !visible
    }

    func setColorScheme(_ colorScheme: MorseColorScheme) {
        let colorScheme = MorseColors(colorScheme: colorScheme)
        previewLabel.backgroundColor = colorScheme.previewBackgroundColor
        previewLabel.textColor = colorScheme.previewTextColor
        backgroundColor = colorScheme.backgroundColor

        for view in subviews {
            if let button = view as? KeyboardButton {
                button.setTitleColor(colorScheme.buttonTextColor, for: [])
                button.tintColor = colorScheme.buttonTextColor

                if button == nextKeyboardButton || button == deleteButton {
                    button.defaultBackgroundColor = colorScheme.buttonHighlightColor
                    button.highlightBackgroundColor = colorScheme.buttonBackgroundColor
                } else {
                    button.defaultBackgroundColor = colorScheme.buttonBackgroundColor
                    button.highlightBackgroundColor = colorScheme.buttonHighlightColor
                }
            }
        }
    }
}

// MARK: - Actions

extension MorseKeyboardView {
    @IBAction func keyPressed(_ sender: UIButton) {
        addSignal(.ㅂ)
    }

    @IBAction func deletePressed() {
        if signalCache.count > 0 {
            // Remove last signal
            signalCache.removeLast()
        }

        if signalCache.count == 0 {
            // Delete because no more signal
            delegate?.deleteCharacterBeforeCursor()
        } else {
            // Building on existing letter by deleting current
            delegate?.deleteCharacterBeforeCursor()
            delegate?.insertCharacter(cacheLetter)
        }
    }

    @IBAction func spacePressed() {
        if signalCache.count > 0 {
            // Clear our the signal cache
            signalCache = []
        } else {
            delegate?.insertCharacter(" ")
        }
    }
}

// MARK: - Private Methods

private extension MorseKeyboardView {
    func addSignal(_ signal: KoreanKey.Signal) {
        if signalCache.count == 0 {
            // Have an empty cache
            signalCache.append(signal)
            delegate?.insertCharacter(cacheLetter)
        } else {
            // Building on existing letter
            signalCache.append(signal)
            delegate?.deleteCharacterBeforeCursor()
            delegate?.insertCharacter(cacheLetter)
        }
    }
}
