//
//  ChartViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit
import Kingfisher
import DGCharts

final class ChartViewController: BaseViewController {
    private let viewModel = ChartViewModel()
    
    private let chartView = ChartView()
    
    var bitcoinID: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.bitcoinID = bitcoinID

        viewModel.coinMarketResult.bind { [weak self] result in
            if let coinMarketResult = result.first {
                self?.chartView.nameLabel.text = coinMarketResult.name
                self?.chartView.currentPriceLabel.text = "\(coinMarketResult.currentPrice)"
                self?.chartView.priceChangePercentageLabel.text = "\(coinMarketResult.priceChangePercentage24h)"
                self?.chartView.highValueLabel.text = "\(coinMarketResult.high24h)"
                self?.chartView.lowValueLabel.text = "\(coinMarketResult.low24h)"
                self?.chartView.athValueLabel.text = "\(coinMarketResult.ath)"
                self?.chartView.atlValueLabel.text = "\(coinMarketResult.atl)"
                
                if let imageURL = URL(string: coinMarketResult.image) {
                    self?.chartView.logoImageView.kf.setImage(with: imageURL)
                }
                
                let entry = coinMarketResult.sparklineIn7d.price.enumerated().map { ChartDataEntry(x: Double($0.offset), y: $0.element) }
                let set = LineChartDataSet(entries: entry, label: "\(coinMarketResult.lastUpdated) 업데이트")   // TODO: 왜 안 보일까..
                set.drawCircleHoleEnabled = true
                set.drawCirclesEnabled = false
                set.setColor(.pointPurple)
                set.lineWidth = 1
                
                self?.chartView.chartView.data = LineChartData(dataSet: set)
                self?.chartView.chartView.pinchZoomEnabled = true
            }
        }
        
        viewModel.fetchCoinMarket()
    }
    
    override func configView() {
        chartView.setupView()
    }
    
    override func configHierarchy() {
        view.addSubview(chartView)
    }
    
    override func configLayout() {
        chartView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
