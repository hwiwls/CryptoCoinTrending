//
//  MyFavoriteRepository.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import Foundation
import RealmSwift

final class StoredCoinRepository {
    let realm = try! Realm()
    
    func createItem(_ item: SearchCoin) {
        do {
            try realm.write {
                let storedCoin = StoredCoin(bitcoinName: item.name, bitcoinSymbol: item.symbol)
                realm.add(storedCoin)
            }
        } catch let error {
            print(error)
        }
    }
}
