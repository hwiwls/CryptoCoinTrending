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

enum CollectionViewType: Int {
    case myFavorite = 0
    case coins = 1
    case nfts = 2
}

final class TrendingViewController: BaseViewController {
    
    private let viewModel = TrendingViewModel()
    
    private let trendingView = TrendingView()
    
    private var coins: [Coin] = []
    
    private let tableViewTitle = ["Top 15 Coin", "Top 7 NFT"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        viewModel.inputViewDidLoadTrigger.value = ()
    }
    
    func bindData() {
        viewModel.outputCoinsData.bind { _ in
            DispatchQueue.main.async {
                self.trendingView.tableView.reloadData()
            }
        }
        
        viewModel.outputNFTsData.bind { _ in
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

// 이 부분 코드들을 Protocol, Delegate를 사용해서 분리하기
extension TrendingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let type = CollectionViewType(rawValue: collectionView.tag) else { return 0 }
        switch type {
        case .myFavorite:
            return 2
        case .coins:
            return viewModel.outputCoinsData.value.count
        case .nfts:
            return viewModel.outputNFTsData.value.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = CollectionViewType(rawValue: collectionView.tag) else { return UICollectionViewCell() }
        switch type {
        case .myFavorite:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFavoriteCollectionViewCell.identifier, for: indexPath) as! MyFavoriteCollectionViewCell
            return cell
        case .coins:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            let coin = viewModel.outputCoinsData.value[indexPath.item]
            cell.nameLabel.text = coin.item.name
            cell.symbolLabel.text = coin.item.symbol
            cell.priceLabel.text = coin.item.data.price
            if let priceChangePercentage = coin.item.data.priceChangePercentage24H["krw"] {
                cell.priceChangePercentLabel.text = String(format: "%.2f", priceChangePercentage) + "%"
                if priceChangePercentage < 0 {
                    cell.priceChangePercentLabel.textColor = .pointBlue
                } else {
                    cell.priceChangePercentLabel.textColor = .pointReactiveRed
                }
            }
            if let url = URL(string: coin.item.small) {
                cell.logoImageView.kf.setImage(with: url)
            }
            cell.rankLabel.text = "\(indexPath.item + 1)"
            return cell
        case .nfts:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            let nft = viewModel.outputNFTsData.value[indexPath.item]
            cell.nameLabel.text = nft.name
            cell.symbolLabel.text = nft.symbol
            cell.priceLabel.text = nft.data.floorPrice
            if let priceChangePercentage = Double(nft.data.floorPriceInUsd24HPercentageChange) {
                cell.priceChangePercentLabel.text = String(format: "%.2f", priceChangePercentage) + "%"
                if priceChangePercentage < 0 {
                    cell.priceChangePercentLabel.textColor = .pointBlue
                } else {
                    cell.priceChangePercentLabel.textColor = .pointReactiveRed
                }
            }
            if let url = URL(string: nft.thumb) {
                cell.logoImageView.kf.setImage(with: url)
            }
            cell.rankLabel.text = "\(indexPath.item + 1)"
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
