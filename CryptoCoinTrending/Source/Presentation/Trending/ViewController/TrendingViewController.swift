//
//  TrendingViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class TrendingViewController: BaseViewController {
    
    let viewModel = TrendingViewModel()
    
    let trendingView = TrendingView()
    
    var coins: [Coin] = []
    
    let tableViewTitle = ["Top 15 Coin", "Top 7 NFT"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CoinGeckoAPIManager.shared.fetchCoinTrending(api: .trending) { results in
            self.coins = results.coins
            DispatchQueue.main.async {
                self.trendingView.tableView.reloadData()
            }
        }
    }
    
    override func configView() {
        trendingView.tableView.delegate = self
        trendingView.tableView.dataSource = self
        trendingView.setupView()
    }
    
    override func configHierarchy() {
        view.addSubview(trendingView)
    }
    
    override func configLayout() {
        trendingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TrendingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 2
        } else {
            return coins.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFavoriteCollectionViewCell.identifier, for: indexPath) as! MyFavoriteCollectionViewCell
            
            return cell
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            
            
            let coin = coins[indexPath.item]
            cell.nameLabel.text = coin.item.name
            cell.symbolLabel.text = coin.item.symbol
            if let price = Double(coin.item.data.price) {
                cell.priceLabel.text = String(format: "%.4f", price)
            }
            if let priceChangePercentage = coin.item.data.priceChangePercentage24H["krw"] {
                cell.priceChangePercentLabel.text = String(format: "%.2f", priceChangePercentage) + "%"
            }
            
            if let url = URL(string: coin.item.small) {
                cell.logoImageView.kf.setImage(with: url)
            }
            
            cell.rankLabel.text = "\(indexPath.item + 1)"
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            
            return cell
        }
    }
}

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyFavoriteTableViewCell.identifier, for: indexPath) as! MyFavoriteTableViewCell
            
            cell.selectionStyle = .none
            cell.myFavoriteCollectionView.delegate = self
            cell.myFavoriteCollectionView.dataSource = self
            cell.myFavoriteCollectionView.register(MyFavoriteCollectionViewCell.self, forCellWithReuseIdentifier: MyFavoriteCollectionViewCell.identifier)
            cell.myFavoriteCollectionView.tag = indexPath.row
            cell.titleLabel.text = "My Favorite"
            
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ChartOverviewTableViewCell.identifier, for: indexPath) as! ChartOverviewTableViewCell
            
            cell.selectionStyle = .none
            cell.chartCollectionView.delegate = self
            cell.chartCollectionView.dataSource = self
            cell.chartCollectionView.register(ChartCollectionViewCell.self, forCellWithReuseIdentifier: ChartCollectionViewCell.identifier)
            cell.chartCollectionView.tag = indexPath.row
            cell.titleLabel.text = tableViewTitle[indexPath.row - 1]
            cell.chartCollectionView.reloadData()
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 230
        } else {
            return 280
        }
    }
    
}
