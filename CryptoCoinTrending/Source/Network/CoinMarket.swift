//
//  CoinMarket.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/4/24.
//

import Foundation

// MARK: - CoinMarketModel
struct CoinMarketModel: Codable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let currentPrice: Double
    let high24h: Double
    let low24h: Double
    let priceChangePercentage24h: Double
    let ath: Double
    let athDate: String
    let atl: Double
    let atlDate: String
    let lastUpdated: String
    let sparklineIn7d: SparklineIn7d

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case ath
        case athDate = "ath_date"
        case atl
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7d = "sparkline_in_7d"
    }
}

struct SparklineIn7d: Codable {
    let price: [Double]
}
