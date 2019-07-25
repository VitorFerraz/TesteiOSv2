//
//  NetworkError.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Foundation
enum NetworkErrors: Error {
    case custom(String)
    case noInternet
    case serviceUnavailable
    case serverError
    case parserError
    case unitTest
    case unknown(String)
}

extension NetworkErrors: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .custom(let msg):
            return msg
        case .noInternet:
            return "Sem conexão com a internet."
        case .serviceUnavailable:
            return "Serviço não disponível."
        case .serverError:
            return "Erro no servidor."
        case .parserError:
            return "Erro ao parsear o retorno da API."
        case .unitTest:
            return "Erro teste unitario."
        case .unknown:
            return self.localizedDescription
        }
    }
}
