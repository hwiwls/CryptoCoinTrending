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
    
    func deleteItem(_ item: SearchCoin) {
        do {
            try realm.write {
                if let storedCoin = realm.objects(StoredCoin.self).filter("bitcoinName == %@", item.name).first {
                    realm.delete(storedCoin)
                }
            }
        } catch let error {
            print(error)
        }
    }
    
    func isItemStored(_ item: SearchCoin) -> Bool {
        let storedCoin = realm.objects(StoredCoin.self).filter("bitcoinName == %@", item.name).first
        return storedCoin != nil
    }
}
