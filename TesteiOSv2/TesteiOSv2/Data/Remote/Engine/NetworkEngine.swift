//
//  NetworkEngine.swift
//  TesteiOSv2
//
//  Created by Vitor Ferraz Varela on 21/07/19.
//  Copyright © 2019 Vitor Ferraz Varela. All rights reserved.
//

import Moya
class NetworkEngine<Target: TargetType> {
    private var provider: MoyaProvider<Target>
    
    init(provider: MoyaProvider<Target>) {
        self.provider = provider
    }
    
    func request<T: Codable>(target: Target, completion: @escaping(Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let value):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(DateFormatter.networkRemoteDateFormatter)
                    return completion(Result.success(try decoder.decode(T.self, from: value.data)))
                } catch {
                    print(error)
                    return completion(Result.failure(NetworkErrors.parserError))
                }
            case .failure(let error):
                return completion(Result.failure(NetworkErrors.unknown(error.localizedDescription)))
            }
        }
    }
    
    func requestVoid(target: Target,
                     completion: @escaping(Result<Void, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success:
                return completion(Result.success(()))
            case .failure(let error):
                return completion(Result.failure(NetworkErrors.unknown(error.localizedDescription)))
            }
        }
    }
}
