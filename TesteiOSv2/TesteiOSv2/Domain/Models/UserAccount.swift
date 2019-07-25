//
//  UserAccount.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct UserAccount: Codable {
    let userId: Int
    let name: String
    let bankAccount: String
    let agency: String
    let balance: Double
}
