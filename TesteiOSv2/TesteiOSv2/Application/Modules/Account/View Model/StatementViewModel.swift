//
//  StatementViewModel.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
struct StatementViewModel {
    var title: String
    var description: String
    var date: String
    var value: String
    private let dateFormatter = DateFormatter.sharedDateFormatter
    
    init(statement: Statement) {
        self.title = statement.title
        self.description = statement.description
        self.date = dateFormatter.string(from: statement.date)
        self.value = CurrencyFormatter.real(value: statement.value)
    }
}
