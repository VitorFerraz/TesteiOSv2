//
//  NetworkConstants.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct NetworkConstants {
    struct URLs {
        static var baseURL: URL {
            guard let url = URL(string: "https://bank-app-test.herokuapp.com") else {
                fatalError("Error to convert string url to URL")
            }
            return url
        }
    }
    
    struct Headers {
        static var contentTypeApplicationJSON = ["Content-Type": "application/json"]
    }
}
