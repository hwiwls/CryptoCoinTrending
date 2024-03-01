//
//  CoinGeckoAPIManager.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import Foundation
import Alamofire

class CoinGeckoAPIManager {
    static let shared = CoinGeckoAPIManager()
    
    // 나중에 제네릭 적용해보기
    func fetchCoinTrending(api: CoinGeckoAPI, completionHandler: @escaping (TrendingModel) -> Void) {
        AF.request(
            api.endpoint,
            method: api.method,
            parameters: api.parameter
        ).responseDecodable(of: TrendingModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
}
