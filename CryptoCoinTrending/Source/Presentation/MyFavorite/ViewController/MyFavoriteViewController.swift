//
//  MyFavoriteViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit
import RealmSwift

final class MyFavoriteViewController: BaseViewController {
    
    private let myFavoriteView = MyFavoriteView()
    
    let repository = StoredCoinRepository()
    
    var list: Results<StoredCoin>!



    override func viewDidLoad() {
        super.viewDidLoad()
        list = repository.fetch()
    }

    override func configView() {
        myFavoriteView.collectionView.delegate = self
        myFavoriteView.collectionView.dataSource = self
        myFavoriteView.setupView()
    }
    
    override func configHierarchy() {
        view.addSubview(myFavoriteView)
    }
    
    override func configLayout() {
        myFavoriteView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    

}

extension MyFavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCoinCollectionViewCell.identifier, for: indexPath) as! FavoriteCoinCollectionViewCell
        
        let row = list[indexPath.row]
        cell.nameLabel.text = row.bitcoinName
        cell.symbolLabel.text = row.bitcoinSymbol
        
        print("Loading image with id: \(row.id)")
        
        if let image = loadImageToDocument(filename: "\(row.id)") {
            cell.coinImageView.image = image
        } else {
            print("Failed to load image for id: \(row.id)")
        }
        
        return cell
    }
    
    
}
