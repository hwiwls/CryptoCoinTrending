//
//  SearchViewModel.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import Foundation
import RealmSwift

final class SearchViewModel {
    var inputSearchTrigger: Observable<String?> = Observable(nil)
    var outputSearchResultData: Observable<[SearchCoin]> = Observable([])
    
    let repository = StoredCoinRepository()
    
    init() {
        inputSearchTrigger.bind { searchText in
            guard let searchText = searchText, !searchText.isEmpty else { return }
            CoinGeckoAPIManager.shared.searchCoin(api: .search(query: searchText)) { result in
                self.outputSearchResultData.value = result.coins
            }
        }
    }
    
    func isCoinFavorite(_ coin: SearchCoin) -> Bool {
        return repository.isItemStored(coin)
    }
    
    func toggleFavoriteStatus(for coin: SearchCoin, isFavorite: Bool) {
        if isFavorite {
            let data = StoredCoin(bitcoinID: coin.id, bitcoinName: coin.name, bitcoinSymbol: coin.symbol)
            StoredCoinRepository().createItem(data)
        } else {
            if let storedCoin = repository.findStoredCoin(coin) {
                StoredCoinRepository().deleteItem(storedCoin)
            }
        }
    }
}
