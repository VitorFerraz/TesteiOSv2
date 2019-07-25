//
//  Statement.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct Statement: Codable {
    let title: String
    let description: String
    let date: Date
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case date
        case value
        case description = "desc"
    }
}

