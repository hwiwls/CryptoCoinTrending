//
//  ChartView.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/4/24.
//

import UIKit
import DGCharts
import SnapKit
import Then

final class ChartView: UIView {
    let logoImageView = UIImageView().then {
        $0.backgroundColor = .red
    }
    
    let nameLabel = UILabel().then {
        $0.text = "name"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 28)
        $0.textAlignment = .left
    }
    
    let currentPriceLabel = UILabel().then {
        $0.text = "currentPrice"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 32)
        $0.textAlignment = .left
    }
    
    let priceChangePercentageLabel = UILabel().then {
        $0.text = "priceChangePercentage"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let todayLabel = UILabel().then {
        $0.text = "today"
        $0.textColor = .pointGray
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let highLabel = UILabel().then {
        $0.text = "고가"
        $0.textColor = .pointReactiveRed
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    let highValueLabel = UILabel().then {
        $0.text = "value"
        $0.textColor = .pointDarkGray
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let lowLabel = UILabel().then {
        $0.text = "저가"
        $0.textColor = .pointBlue
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    let lowValueLabel = UILabel().then {
        $0.text = "value"
        $0.textColor = .pointDarkGray
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let athLabel = UILabel().then {
        $0.text = "신고점"
        $0.textColor = .pointReactiveRed
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    let athValueLabel = UILabel().then {
        $0.text = "value"
        $0.textColor = .pointDarkGray
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let atlLabel = UILabel().then {
        $0.text = "신저점"
        $0.textColor = .pointBlue
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textAlignment = .left
    }
    
    let atlValueLabel = UILabel().then {
        $0.text = "value"
        $0.textColor = .pointDarkGray
        $0.font = .systemFont(ofSize: 16)
        $0.textAlignment = .left
    }
    
    let chartView = LineChartView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubviews([
            logoImageView,
            nameLabel,
            currentPriceLabel,
            priceChangePercentageLabel,
            todayLabel,
            highLabel,
            highValueLabel,
            lowLabel,
            lowValueLabel,
            athLabel,
            athValueLabel,
            atlLabel,
            atlValueLabel,
            chartView
        ])
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.bottom.equalTo(logoImageView)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(4)
        }
        
        currentPriceLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        priceChangePercentageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(currentPriceLabel.snp.bottom).offset(8)
        }
        
        todayLabel.snp.makeConstraints {
            $0.top.equalTo(priceChangePercentageLabel)
            $0.leading.equalTo(priceChangePercentageLabel.snp.trailing).offset(8)
        }
        
        highLabel.snp.makeConstraints {
            $0.top.equalTo(priceChangePercentageLabel.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        highValueLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(highLabel.snp.bottom).offset(8)
        }
        
        lowLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(20)
            $0.top.equalTo(priceChangePercentageLabel.snp.bottom).offset(40)
        }
        
        lowValueLabel.snp.makeConstraints {
            $0.leading.equalTo(lowLabel)
            $0.top.equalTo(lowLabel.snp.bottom).offset(8)
        }
        
        athLabel.snp.makeConstraints {
            $0.top.equalTo(highValueLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        
        athValueLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(athLabel.snp.bottom).offset(8)
        }
        
        atlLabel.snp.makeConstraints {
            $0.top.equalTo(highValueLabel.snp.bottom).offset(20)
            $0.leading.equalTo(lowLabel)
        }
        
        atlValueLabel.snp.makeConstraints {
            $0.leading.equalTo(atlLabel)
            $0.top.equalTo(atlLabel.snp.bottom).offset(8)
        }
        
        chartView.snp.makeConstraints {
            $0.top.equalTo(atlValueLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()  // 너비가 원하는대로 안 잡히는 느낌
            $0.height.equalTo(300)
        }
        
    }

}
