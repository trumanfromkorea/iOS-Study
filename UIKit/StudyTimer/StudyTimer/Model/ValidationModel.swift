//
//  ValidationModel.swift
//  StudyTimer
//
//  Created by 장재훈 on 2022/06/16.
//

import Foundation

struct Validation {
    static func email(_ email: String?) -> Bool {
        guard let email = email else {
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    static func password(_ password: String?) -> Bool {
        guard let password = password else {
            return false
        }

        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9]).{8,50}" // 8자리 ~ 50자리 영어 + 숫자
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
}
