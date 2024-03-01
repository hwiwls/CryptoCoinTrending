//
//  TrendingView.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit

final class TrendingView: UIView {
    let titleLabel = UILabel().then {
        $0.text = "Crypto Coin"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 28)
        $0.textAlignment = .left
    }
    
    let tableView = UITableView()
    
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
            tableView
        ])
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(MyFavoriteTableViewCell.self, forCellReuseIdentifier: MyFavoriteTableViewCell.identifier)
        tableView.register(ChartOverviewTableViewCell.self, forCellReuseIdentifier: ChartOverviewTableViewCell.identifier)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
