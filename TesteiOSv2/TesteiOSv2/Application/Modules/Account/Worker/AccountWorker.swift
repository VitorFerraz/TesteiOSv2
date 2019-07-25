//
//  AccountWorker.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 24/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

final class AccountWorker {
    let repository: AccountRepository
    init(repository: AccountRepository = AccountRemoteRepository()) {
        self.repository = repository
    }
    func fetchStatements(completion: @escaping (Result<StatementResponse, Error>) -> Void) {
        repository.loadStatements(completionHandler: completion)
    }
}
