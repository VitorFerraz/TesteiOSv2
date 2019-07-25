//
//  Validator.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
enum Validator {
    case validateDocumentNumber(documentNumber: String?)
    case validateEmail(email: String?)
    case validatePassword(password: String?)
}

extension Validator {
    var isValid: Bool {
        switch self {
     
        case .validateDocumentNumber(let value):
            let pattern = "^[0-9]{11}$"
            guard let documentNumber = value, !documentNumber.isEmpty else { return false }
            let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(0..<documentNumber.count)
            let match = regex?.firstMatch(in: documentNumber, options: .reportCompletion, range: range)
            return match != nil
        case .validateEmail(let value):
            let pattern = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
            guard let email = value, !email.isEmpty else { return false }
            let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            let range = NSRange(0..<email.count)
            let match = regex?.firstMatch(in: email, options: .reportCompletion, range: range)
            return match != nil
        case .validatePassword(let value):
            let pattern = "^(?=.*[A-Z])(?=.*[!@#$%&])(?=.*[0-9])."
            guard let password = value, !password.isEmpty else { return false }
            let regex = try? NSRegularExpression(pattern: pattern, options: .anchorsMatchLines)
            let range = NSRange(0..<password.count)
            let match = regex?.firstMatch(in: password, options: .reportCompletion, range: range)
            return match != nil
        }
    }
}
