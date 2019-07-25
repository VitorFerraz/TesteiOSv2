//
//  LoginError.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
enum LoginError: Error {
    case emptyUser, invalidUser, emptyPassword, invalidPassword
}

extension LoginError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .emptyPassword:
            return "Por favor, digite sua senha."
        case .emptyUser:
            return "Por favor, digite seu usuário."
        case .invalidUser:
            return "Por favor, o usuário é um e-mail ou CPF válidos."
        case .invalidPassword:
            return "Por favor, a senha deve ter pelo menos uma letra maiúscula, um caractere especial e um caractere alfanumérico."
        }
    }
}
