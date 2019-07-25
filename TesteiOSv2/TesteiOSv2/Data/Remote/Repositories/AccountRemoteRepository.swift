//
//  AccountRemoteRepository.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Moya

struct AccountRemoteRepository {
    
    private var engine: NetworkEngine<AccountService> {
        let logPlugin = NetworkLoggerPlugin(verbose: true, cURL: true, output: nil, requestDataFormatter: nil, responseDataFormatter: nil)
        let provider = MoyaProvider<AccountService>(plugins:[logPlugin])
        return NetworkEngine<AccountService>(provider: provider)
    }
}

extension AccountRemoteRepository: AccountRepository {
    func loadStatements(completionHandler: @escaping (Result<StatementResponse, Error>) -> Void) {
        engine.request(target: .loadStatements, completion: completionHandler)
    }
  
    
}
