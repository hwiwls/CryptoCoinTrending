//
//  TrendingViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/27/24.
//

import UIKit
import SnapKit
import Then

final class TrendingViewController: BaseViewController {
    
    let viewModel = TrendingViewModel()
    
    let tableViewTitle = ["Top 15 Coin", "Top 7 NFT"]
    
//    private let titleLabel = UILabel().then {
//        $0.text = "Crypto Coin"
//        $0.textColor = .black
//        $0.font = .boldSystemFont(ofSize: 28)
//        $0.textAlignment = .left
//    }
//    
//    let tableView = UITableView()
    
    let trendingView = TrendingView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configView() {
        trendingView.tableView.delegate = self
        trendingView.tableView.dataSource = self
        trendingView.setupView()
//        tableView.separatorStyle = .none
//        tableView.backgroundColor = .clear
//        tableView.register(MyFavoriteTableViewCell.self, forCellReuseIdentifier: MyFavoriteTableViewCell.identifier)
//        tableView.register(ChartOverviewTableViewCell.self, forCellReuseIdentifier: ChartOverviewTableViewCell.identifier)
    }
    
    override func configHierarchy() {
//        view.addSubviews([
//            titleLabel,
//            tableView
//        ])
        view.addSubview(trendingView)
    }
    
    override func configLayout() {
//        titleLabel.snp.makeConstraints {
//            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24)
//            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
//        }
//        tableView.snp.makeConstraints {
//            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
//            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
//        }
        
        trendingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension TrendingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFavoriteCollectionViewCell.identifier, for: indexPath) as! MyFavoriteCollectionViewCell
            
            return cell
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            
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
//            cell.chartCollectionView.reloadData()
            cell.titleLabel.text = tableViewTitle[indexPath.row - 1]
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        } else {
            return 280
        }
    }
    
}
