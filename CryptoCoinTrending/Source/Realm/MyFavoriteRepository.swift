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
    
    func createItem(_ item: StoredCoin) {
        do {
            try realm.write {
                realm.add(item)
            }
        } catch let error {
            print(error)
        }
    }
    
    func deleteItem(_ item: StoredCoin) {
        do {
            try realm.write {
                if let storedCoin = realm.objects(StoredCoin.self).filter("bitcoinName == %@", item.bitcoinName).first {
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
    
    func fetch() -> Results<StoredCoin> {
        return realm.objects(StoredCoin.self)
    }
    
    func findStoredCoin(_ item: SearchCoin) -> StoredCoin? {
        return realm.objects(StoredCoin.self).filter("bitcoinName == %@", item.name).first
    }
}
