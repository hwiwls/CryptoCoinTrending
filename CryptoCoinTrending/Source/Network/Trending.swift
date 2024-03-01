//
//  Trending.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import Foundation

struct TrendingModel: Codable {
    let coins: [Coin]
    let nfts: [Nft]
}

// MARK: - Coin
struct Coin: Codable {
    let item: Item
}

// MARK: - Item
struct Item: Codable {
    let id: String
    let name, symbol: String
    let small: String
    let data: ItemData
}

// MARK: - ItemData
struct ItemData: Codable {
    let priceChangePercentage24H: [String: Double]
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case priceChangePercentage24H = "price_change_percentage_24h"
        case price = "price"
    }
}

// MARK: - Nft
struct Nft: Codable {
    let name, symbol: String
    let thumb: String
    let data: NftData
}

// MARK: - NftData
struct NftData: Codable {
    let floorPrice, floorPriceInUsd24HPercentageChange: String

    enum CodingKeys: String, CodingKey {
        case floorPrice = "floor_price"
        case floorPriceInUsd24HPercentageChange = "floor_price_in_usd_24h_percentage_change"
    }
}
