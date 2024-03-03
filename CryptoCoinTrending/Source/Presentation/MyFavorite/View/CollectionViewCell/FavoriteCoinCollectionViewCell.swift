//
//  FavoriteCoinCollectionViewCell.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/3/24.
//

import UIKit
import SnapKit
import Then

final class FavoriteCoinCollectionViewCell: UICollectionViewCell {
    static let identifier = "FavoriteCoinCellIdentifier"
    
    private let contentsView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let coinImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(systemName: "star")
        $0.backgroundColor = .orange
    }
    
    let nameLabel = UILabel().then {
        $0.text = "Bitcoin"
        $0.textColor = .pointDarkGray
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textAlignment = .left
    }
    
    let symbolLabel = UILabel().then {
        $0.text = "BTC"
        $0.textColor = .pointGray
        $0.font = .systemFont(ofSize: 12)
        $0.textAlignment = .left
    }
    
    let priceLabel = UILabel().then {
        $0.text = "₩69,234,245"
        $0.textColor = .pointDarkGray
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    let priceChangePercentageLabel = UILabel().then {
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
        contentsView.layer.shadowColor = UIColor.black.cgColor 
        contentsView.layer.shadowOffset = CGSize(width: 0, height: 1)
        contentsView.layer.shadowOpacity = 0.1
        contentsView.layer.shadowRadius = 4
        contentsView.layer.cornerRadius = 20
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
            $0.leading.top.equalToSuperview().offset(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(coinImageView.snp.top)
            $0.leading.equalTo(coinImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(4)
        }
        
        symbolLabel.snp.makeConstraints {
            $0.bottom.equalTo(coinImageView.snp.bottom)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalToSuperview().inset(4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.bottom.equalTo(priceChangePercentageLabel.snp.top).offset(-8)
        }
        
        priceChangePercentageLabel.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(12)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
