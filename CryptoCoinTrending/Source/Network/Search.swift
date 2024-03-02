//
//  Search.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    let coins: [SearchCoin]
}

// MARK: - Coin
struct SearchCoin: Codable {
    let id, name, symbol: String
    let thumb: String
}
