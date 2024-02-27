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
    
    private let titleLabel = UILabel().then {
        $0.text = "Crypto Coin"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 28)
        $0.textAlignment = .left
    }
    
    private let myFavoriteLabel = UILabel().then {
        $0.text = "My Favorite"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .left
    }
    
    lazy var myFavoriteCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: configureCollectionViewLayout()
    ).then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
        $0.register(MyFavoriteCollectionViewCell.self, forCellWithReuseIdentifier: MyFavoriteCollectionViewCell.identifier)
        $0.backgroundColor = .clear
        $0.tag = 2
    }
    
    let tableView = UITableView()
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 220, height: 160)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 280
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(ChartOverviewTableViewCell.self, forCellReuseIdentifier: ChartOverviewTableViewCell.identifier)
    }
    
    override func configHierarchy() {
        view.addSubviews([
            titleLabel,
            myFavoriteLabel,
            myFavoriteCollectionView,
            tableView
        ])
    }
    
    override func configLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        myFavoriteLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        myFavoriteCollectionView.snp.makeConstraints {
            $0.top.equalTo(myFavoriteLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(160)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(myFavoriteCollectionView.snp.bottom).offset(20)
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension TrendingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            
            return cell
        } else if collectionView.tag == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChartCollectionViewCell.identifier, for: indexPath) as! ChartCollectionViewCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFavoriteCollectionViewCell.identifier, for: indexPath) as! MyFavoriteCollectionViewCell
            
            return cell
        }
    }
}

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChartOverviewTableViewCell.identifier, for: indexPath) as! ChartOverviewTableViewCell
        
        cell.selectionStyle = .none
        
        cell.trendingCollectionView.delegate = self
        cell.trendingCollectionView.dataSource = self
        cell.trendingCollectionView.register(ChartCollectionViewCell.self, forCellWithReuseIdentifier: ChartCollectionViewCell.identifier)
        cell.trendingCollectionView.tag = indexPath.row
        cell.trendingCollectionView.reloadData()
        
        cell.titleLabel.text = tableViewTitle[indexPath.row]
        
        return cell
    }
    
    
}
