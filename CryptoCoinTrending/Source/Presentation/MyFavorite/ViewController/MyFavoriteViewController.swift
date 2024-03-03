//
//  MyFavoriteViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit
import RealmSwift

final class MyFavoriteViewController: BaseViewController {
    
    private let viewModel = MyFavoriteViewModel()
    
    private let myFavoriteView = MyFavoriteView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.list = viewModel.repository.fetch()
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
        return viewModel.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoriteCoinCollectionViewCell.identifier, for: indexPath) as! FavoriteCoinCollectionViewCell
        
        let row = viewModel.list[indexPath.row]
        cell.nameLabel.text = row.bitcoinName
        cell.symbolLabel.text = row.bitcoinSymbol
        
        if let image = loadImageToDocument(filename: "\(row.id)") {
            cell.coinImageView.image = image
        } else {
            print("Fail: \(row.id)")
        }
        
        return cell
    }
}
