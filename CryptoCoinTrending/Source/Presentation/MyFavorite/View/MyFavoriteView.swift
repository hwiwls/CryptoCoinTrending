//
//  MyFavoriteView.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/3/24.
//

import UIKit
import SnapKit
import Then


final class MyFavoriteView: UIView {
    let titleLabel = UILabel().then {
        $0.text = "Favorite Coin"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 28)
        $0.textAlignment = .left
    }
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 24, height: 160)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubviews([
            titleLabel,
            collectionView
        ])
        
        collectionView.backgroundColor = .clear
        collectionView.register(FavoriteCoinCollectionViewCell.self, forCellWithReuseIdentifier: FavoriteCoinCollectionViewCell.identifier)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
