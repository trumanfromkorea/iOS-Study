//
//  KeyValue.swift
//  CustomKeyboard
//
//  Created by 장재훈 on 2022/07/12.
//

import Foundation
import UIKit

class KeyData {
    static let keyboardText = [
        ["ㅂ", "ㅈ", "ㄷ", "ㄱ", "ㅅ", "ㅛ", "ㅕ", "ㅑ", "ㅐ", "ㅔ"],
        ["ㅁ", "ㄴ", "ㅇ", "ㄹ", "ㅎ", "ㅗ", "ㅓ", "ㅏ", "ㅣ"],
        ["ㅋ", "ㅌ", "ㅊ", "ㅍ", "ㅠ", "ㅜ", "ㅡ"],
    ]

    enum ButtonLine: Int {
        case line1
        case line2
        case line3
    }

    static let KeyboardTypeString: [UIReturnKeyType: String] = [
        .continue: "Continue",
        .default: "Return",
        .done: "Done",
        .emergencyCall: "Call",
        .go: "Go",
        .google: "Google",
        .join: "Join",
        .next: "Next",
        .route: "Route",
        .search: "Search",
        .send: "Send",
        .yahoo: "Yahoo",
    ]

    static let keyboardButtonText: [ButtonLine: [String]] = [
        .line1: keyboardText[0],
        .line2: keyboardText[1],
        .line3: keyboardText[2],
    ]

    static func getLineText(buttonType: ButtonLine) -> ([String]) {
        switch buttonType {
        case .line1: return (keyboardButtonText[.line1]!)
        case .line2: return (keyboardButtonText[.line2]!)
        case .line3: return (keyboardButtonText[.line3]!)
        }
    }
}
