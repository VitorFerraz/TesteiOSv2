//
//  LoginRemoteRepository.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Moya

struct LoginRemoteRepository {
    
    private var engine: NetworkEngine<LoginService> {
        let logPlugin = NetworkLoggerPlugin(verbose: true, cURL: true, output: nil, requestDataFormatter: nil, responseDataFormatter: nil)
        let provider = MoyaProvider<LoginService>(plugins:[logPlugin])
        return NetworkEngine<LoginService>(provider: provider)
    }
}

extension LoginRemoteRepository: LoginRepository {
    func submitLogin(loginRequest: Login, completionHandler: @escaping (Result<UserAccountResponse, Error>) -> Void) {
        engine.request(target: .signIn(login: loginRequest), completion: completionHandler)
    }
    
}
