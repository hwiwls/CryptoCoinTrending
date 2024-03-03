//
//  SearchResultTableViewCell.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import UIKit
import SnapKit
import Then

protocol SearchResultTableViewCellDelegate: AnyObject {
    func favoriteButtonTapped(on cell: SearchResultTableViewCell)
}

final class SearchResultTableViewCell: UITableViewCell {
    
    static let identifier = "SearchResultCellIdentifier"
    
    weak var delegate: SearchResultTableViewCellDelegate?
    
    var isFavorite: Bool = false
    
    let logoImageView = UIImageView().then {
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
    
    let favoriteBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal).withTintColor(.pointPurple), for: .normal)
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
            logoImageView,
            nameLabel,
            symbolLabel,
            favoriteBtn
        ])
    }
    
    func configLayout() {
        logoImageView.snp.makeConstraints {
            $0.size.equalTo(28)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.centerY).offset(-1)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(12)
        }
        
        symbolLabel.snp.makeConstraints {
            $0.top.equalTo(self.snp.centerY).offset(1)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(12)
        }
        
        favoriteBtn.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configView() {
        backgroundColor = .clear
        favoriteBtn.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    func setFavoriteStatus(_ status: Bool) {
        isFavorite = status
        favoriteBtn.setImage(UIImage(systemName: status ? "star.fill" : "star")?.withRenderingMode(.alwaysOriginal).withTintColor(.pointPurple), for: .normal)
    }
    
    @objc func favoriteButtonTapped() {
        isFavorite = !isFavorite
        setFavoriteStatus(isFavorite)
        delegate?.favoriteButtonTapped(on: self)
    }
}
