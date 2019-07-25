//
//  AccountRepository.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 22/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
protocol AccountRepository {
    func loadStatements(completionHandler: @escaping (Result<StatementResponse, Error>) -> Void)
}
