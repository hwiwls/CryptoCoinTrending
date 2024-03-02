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
            // View가 로드된 후에 필요한 초기화 작업을 여기에 작성합니다.
        }

        inputSearchTrigger.bind { searchText in
            guard let searchText = searchText, !searchText.isEmpty else { return }
            CoinGeckoAPIManager.shared.searchCoin(api: .search(query: searchText)) { result in
                self.outputSearchResultData.value = result.coins
            }
        }
    }
    
    func saveToRealm(coin: SearchCoin) {
        repository.createItem(coin)
    }
}
