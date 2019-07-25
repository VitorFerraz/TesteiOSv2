//
//  StatementResponse.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct StatementResponse: Codable {
    let statements: [Statement]
    
    enum CodingKeys: String, CodingKey {
        case statements = "statementList"
    }
}
