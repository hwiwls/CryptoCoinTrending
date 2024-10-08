//
//  ChartOverviewTableViewCell.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 2/28/24.
//

import UIKit
import SnapKit
import Then

final class ChartOverviewTableViewCell: UITableViewCell {
    
    static let identifier = "ChartOverviewCellIdentifier"
    
    let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.textAlignment = .left
    }
    
    lazy var chartCollectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 68, height: 70)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 28, bottom: 0, right: 28)
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
            chartCollectionView
        ])
    }
    
    func configLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(22)
        }
        
        chartCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(210)
        }
    }
    
    func configView() {
        backgroundColor = .clear
        titleLabel.backgroundColor = .clear
        chartCollectionView.backgroundColor = .clear
    }
}
