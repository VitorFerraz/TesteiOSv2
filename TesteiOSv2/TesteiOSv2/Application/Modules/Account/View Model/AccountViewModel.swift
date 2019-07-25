//
//  AccountViewModel.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation

final class AccountViewModel {
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

    var list = [StatementViewModel](){
        didSet {
            currentState = list.isEmpty ? .noData : .loaded
        }
    }
    var stateChange: (()-> Void)?

    init(userAccount: UserAccount) {
        self.userAccount = userAccount
        currentState = .loading
    }
    var currentState: State = .loading {
        didSet {
            stateChange?()
        }
    }
    enum State: String {
        case loading = "Carregando extrato..."
        case noData = "Nenhum registro encontrado"
        case error = "Ops, ocorreu um erro tente novamente"
        case loaded = ""
    }
}
