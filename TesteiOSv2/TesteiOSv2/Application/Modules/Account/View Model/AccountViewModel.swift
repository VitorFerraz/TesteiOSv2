//
//  AccountViewModel.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

struct AccountViewModel {
    private let userAccount: UserAccount
    var name: String {
        return userAccount.name
    }
    var account: String {
        return "\(userAccount.bankAccount) / \(userAccount.agency)"
    }
    var balance: String {
        return CurrencyFormatter.real(value: userAccount.balance)
    }

    var list = [StatementViewModel]()
    
    init(userAccount: UserAccount) {
        self.userAccount = userAccount
    }
}
