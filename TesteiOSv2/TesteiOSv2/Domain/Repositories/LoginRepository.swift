//
//  LoginRepository.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
protocol LoginRepository {
    func submitLogin(loginRequest: Login, completionHandler: @escaping (Result<UserAccountResponse, Error>) -> Void)
}
