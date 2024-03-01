//
//  MyFavoriteTableViewCell.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit
import SnapKit
import Then

class MyFavoriteTableViewCell: UITableViewCell {

    static let identifier = "MyFavoriteCellIdentifier"
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    lazy var myFavoriteCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 220, height: 160)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return layout
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configLayout()
        configView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configHierarchy() {
        contentView.addSubviews([
            titleLabel,
            myFavoriteCollectionView
        ])
    }
    
    func configLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(22)
        }
        
        myFavoriteCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(160)
        }
    }
    
    func configView() {
        backgroundColor = .clear
        titleLabel.backgroundColor = .clear
        myFavoriteCollectionView.backgroundColor = .clear
    }
}
