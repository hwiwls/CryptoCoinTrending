//
//  TrendingViewModel.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import Foundation

final class TrendingViewModel {
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    var outputCoinsData: Observable<[Coin]> = Observable([])
    var outputNFTsData: Observable<[Nft]> = Observable([])
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            self.fetchCoins()
        }
    }
    
    private func fetchCoins() {
        CoinGeckoAPIManager.shared.fetchCoinTrending(api: .trending) { results in
            self.outputCoinsData.value = results.coins
            self.outputNFTsData.value = results.nfts
        }
    }
}
