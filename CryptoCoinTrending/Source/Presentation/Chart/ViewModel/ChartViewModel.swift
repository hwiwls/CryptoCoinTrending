//
//  ChartViewModel.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/4/24.
//

import Foundation

final class ChartViewModel {
    var coinMarketResult: Observable<[CoinMarketModel]> = Observable([])
    var bitcoinID: String = ""
    
    func fetchCoinMarket() {
        CoinGeckoAPIManager.shared.fetchCoinMarket(api: .market(id: bitcoinID)) { [weak self] result in
            self?.coinMarketResult.value = result
        }
    }
}
