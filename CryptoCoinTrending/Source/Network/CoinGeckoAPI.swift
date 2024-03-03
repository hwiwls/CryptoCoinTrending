//
//  CoinGeckoAPI.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import Foundation
import Alamofire

enum CoinGeckoAPI {
    case trending
    case search(query: String)
    case market(id: String)
    
    var baseURL: String {
        return "https://api.coingecko.com/api/v3/"
    }
    
    var endpoint: URL {
        switch self {
        case .trending:
            return URL(string: baseURL + "search/trending")!
        case .search:
            return URL(string: baseURL + "search")!
        case .market(let id):
           // https://api.coingecko.com/api/v3/coins/markets?vs_currency=krw&ids={id}
           return URL(string: baseURL + "coins/markets?vs_currency=krw&ids=\(id)&sparkline=true")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameter: Parameters {
        switch self {
        case .trending:
            ["": ""]
        case .search(let query):
            ["query": query]
        case .market:
            ["":""]
        }
    }
    
    
}
