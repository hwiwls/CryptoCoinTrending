//
//  ChartCollectionViewCell.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import UIKit
import SnapKit
import Then

final class ChartCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ChartCellIdentifier"
    
    let rankLabel = UILabel().then {
        $0.text = "1"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .pointDarkGray
    }
    
    let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(systemName: "star")
    }
    
    let nameLabel = UILabel().then {
        $0.text = "nameLabel"
        $0.textColor = .pointDarkGray
        $0.font = .boldSystemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let symbolLabel = UILabel().then {
        $0.text = "symbolLabel"
        $0.textColor = .pointDarkGray
        $0.font = .systemFont(ofSize: 14)
    }
    
    let priceLabel = UILabel().then {
        $0.text = "$0.4715"
        $0.textColor = .pointDarkGray
        $0.font = .systemFont(ofSize: 15)
        $0.textAlignment = .right
    }
    
    let priceChangePercentLabel = UILabel().then {
        $0.text = "+21.18%"
        $0.textColor = .red
        $0.font = .systemFont(ofSize: 13)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        contentView.addSubview(logoImageView)
        contentView.addSubview(nameLabel)
        
        contentView.addSubviews([
            rankLabel,
            logoImageView,
            nameLabel,
            symbolLabel,
            priceLabel,
            priceChangePercentLabel
        ])
    }
    
    func configureLayout() {
        rankLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        logoImageView.snp.makeConstraints {
            $0.size.equalTo(35)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(rankLabel.snp.trailing).offset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.top)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(8)
            $0.width.equalTo(150)
        }
        
        symbolLabel.snp.makeConstraints {
            $0.bottom.equalTo(logoImageView.snp.bottom)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(8)
        }
        
        priceLabel.snp.makeConstraints {
            $0.bottom.equalTo(nameLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(80)
        }
        
        priceChangePercentLabel.snp.makeConstraints {
            $0.bottom.equalTo(symbolLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configureView() {
        logoImageView.image = UIImage(systemName: "person")
        nameLabel.text = "테스트"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
