//
//  AccountService.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 24/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Moya

enum AccountService {
    case loadStatements
}

extension AccountService: TargetType {
    var baseURL: URL {
        return NetworkConstants.URLs.baseURL
    }
    
    var path: String {
        return "/api/statements/1"
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return NetworkConstants.Headers.contentTypeApplicationJSON
    }
    
}
