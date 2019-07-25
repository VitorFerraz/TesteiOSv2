//
//  LoginViewModel.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct LoginViewModel {
    var errorMessage: String?
    var activateUserTextField = false
    var activatePasswordTextField = false
    var user: String?
    var password: String?
    
    init(user: String?, password: String?) {
        self.user = user
        self.password = password
    }
    init(error: Error?) {
        errorMessage = error?.localizedDescription
        switch error as? LoginError {
        case .some(.emptyUser), .some(.invalidUser):
            activateUserTextField = true
        case .some(.emptyPassword), .some(.invalidPassword):
            activatePasswordTextField = true
        default:
            break
        }
    }
}
