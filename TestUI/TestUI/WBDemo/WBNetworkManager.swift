//
//  WBNetworkManager.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/8.
//

import SwiftUI
import Alamofire

private let NetworkAPIBaseURL = "https://github.com/xiaoyouxinqing/PostDemo/blob/392dc6e0c7b5d54a7432bf49e9458c58fbc9f547/PostDemo/Resources/"

class WBNetworkManager {
    static let shared = WBNetworkManager()
    private init() {}
    func requestGet(path: String, parameters: Parameters?, completion: @escaping (Result<Data, Error>) -> Void) -> DataRequest {
        AF.request(NetworkAPIBaseURL + path, parameters: parameters) { request in
            request.timeoutInterval = 15
        }.responseData { response in
            switch response.result {
            case let .success(data):
                completion(.success(data))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
