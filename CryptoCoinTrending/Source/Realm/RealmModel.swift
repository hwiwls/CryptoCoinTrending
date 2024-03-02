//
//  RealmModel.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import UIKit
import Foundation
import RealmSwift

class StoredCoin: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var bitcoinName: String
    @Persisted var bitcoinSymbol: String
    
    convenience init(bitcoinName: String, bitcoinSymbol: String) {
        self.init()
        self.bitcoinName = bitcoinName
        self.bitcoinSymbol = bitcoinSymbol
    }
}
