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
    @Persisted var bitcoinID: String
    @Persisted var bitcoinName: String
    @Persisted var bitcoinSymbol: String
    
    convenience init(bitcoinID: String, bitcoinName: String, bitcoinSymbol: String) {
        self.init()
        self.bitcoinID = bitcoinID
        self.bitcoinName = bitcoinName
        self.bitcoinSymbol = bitcoinSymbol
    }
}
