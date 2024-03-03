//
//  SearchViewModel.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import Foundation
import RealmSwift

final class SearchViewModel {
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    var inputSearchTrigger: Observable<String?> = Observable(nil)
    var outputSearchResultData: Observable<[SearchCoin]> = Observable([])
    
    let repository = StoredCoinRepository()
    
    init() {
        inputViewDidLoadTrigger.bind { _ in
            
        }

        inputSearchTrigger.bind { searchText in
            guard let searchText = searchText, !searchText.isEmpty else { return }
            CoinGeckoAPIManager.shared.searchCoin(api: .search(query: searchText)) { result in
                self.outputSearchResultData.value = result.coins
            }
        }
    }
    
    func saveToRealm(coin: StoredCoin) {
        repository.createItem(coin)
    }
    
    func deleteFromRealm(_ coin: StoredCoin) {
        repository.deleteItem(coin)
    }
    
    func isCoinFavorite(_ coin: SearchCoin) -> Bool {
        return repository.isItemStored(coin)
    }
    
}
