//
//  LoginService.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Moya

enum LoginService {
    case signIn(login: Login)
}

extension LoginService: TargetType {
    var baseURL: URL {
        return NetworkConstants.URLs.baseURL
    }
    
    var path: String {
        return "/api/login"
    }
    
    var method: Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .signIn(let request):
            return .requestCustomJSONEncodable(request, encoder: JSONEncoder())
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstants.Headers.contentTypeApplicationJSON
    }
    
}
