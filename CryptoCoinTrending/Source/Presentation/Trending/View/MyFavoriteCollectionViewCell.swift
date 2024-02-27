//
//  MyFavoriteCollectionViewCell.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import UIKit
import SnapKit
import Then

final class MyFavoriteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MyFavoriteCellIdentifier"
    
    private let contentsView = UIView().then {
        $0.backgroundColor = .pointLightGray
    }
    
    private lazy var coinImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(systemName: "star")
        $0.backgroundColor = .orange
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "Bitcoin"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textAlignment = .left
    }
    
    private let symbolLabel = UILabel().then {
        $0.text = "BTC"
        $0.textColor = .pointGray
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .left
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "₩69,234,245"
        $0.textColor = .pointGray
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    private let priceChangePercentageLabel = UILabel().then {
        $0.text = "₩69,234,245"
        $0.textColor = .pointGray
        $0.font = .boldSystemFont(ofSize: 12)
        $0.textAlignment = .left
        $0.textColor = .pointReactiveRed
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        
        configView()
        configHierarchy()
        configLayout()
    }
    
    private func configView() {
        contentsView.layer.cornerRadius = 20
        coinImageView.layer.cornerRadius = coinImageView.frame.width / 2
    }
    
    private func configHierarchy() {
        contentView.addSubview(contentsView)
        
        contentsView.addSubviews([
            coinImageView,
            nameLabel,
            symbolLabel,
            priceLabel,
            priceChangePercentageLabel
        ])
    }
    
    private func configLayout() {
        contentsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        coinImageView.snp.makeConstraints {
            $0.width.height.equalTo(35)
            $0.leading.top.equalToSuperview().offset(12)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(coinImageView.snp.top)
            $0.leading.equalTo(coinImageView.snp.trailing).offset(8)
        }
        
        symbolLabel.snp.makeConstraints {
            $0.bottom.equalTo(coinImageView.snp.bottom)
            $0.leading.equalTo(nameLabel)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.bottom.equalTo(priceChangePercentageLabel.snp.top).offset(-8)
        }
        
        priceChangePercentageLabel.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
