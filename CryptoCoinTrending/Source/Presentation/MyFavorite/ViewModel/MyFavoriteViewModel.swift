//
//  MyFavoriteModel.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/3/24.
//

import Foundation
import RealmSwift

final class MyFavoriteViewModel {
    let repository = StoredCoinRepository()
    var list: Results<StoredCoin>!
    
    init() {
        list = repository.fetch()
    }
}
