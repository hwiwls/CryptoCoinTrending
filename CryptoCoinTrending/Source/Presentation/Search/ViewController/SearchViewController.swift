//
//  SearchViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit
import RealmSwift

final class SearchViewController: BaseViewController {
    
    private let viewModel = SearchViewModel()

    private let searchView = SearchView()
    
    private var searchResult: [SearchCoin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.inputViewDidLoadTrigger.value = ()
        viewModel.outputSearchResultData.bind { _ in
            self.searchView.tableView.reloadData()
        }
        
        let realm = try! Realm()
        print(realm.configuration.fileURL ?? "")
    }
    
    override func configView() {
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.tableView.rowHeight = 60
        searchView.searchBar.delegate = self
        searchView.setupView()
    }
    
    override func configHierarchy() {
        view.addSubview(searchView)
    }
    
    override func configLayout() {
        searchView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputSearchResultData.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as! SearchResultTableViewCell
        
        cell.selectionStyle = .none
        
        let searchResult = viewModel.outputSearchResultData.value[indexPath.row]
        
        if let searchText = searchView.searchBar.text, !searchText.isEmpty {
            let attributedString = NSMutableAttributedString(string: searchResult.name)
            let range = (searchResult.name as NSString).range(of: searchText)
            
            attributedString.addAttribute(.foregroundColor, value: UIColor.pointPurple, range: range)
            
            cell.nameLabel.attributedText = attributedString
        } else {
            cell.nameLabel.text = searchResult.name
        }
        
        if let url = URL(string: searchResult.thumb) {
            cell.logoImageView.kf.setImage(with: url)
        }
        
        let isFavorite = viewModel.isCoinFavorite(coin: searchResult)
        cell.setFavoriteStatus(isFavorite)
        
        cell.symbolLabel.text = searchResult.symbol
        cell.delegate = self
        
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        CoinGeckoAPIManager.shared.searchCoin(api: .search(query: searchView.searchBar.text ?? "")) { result in
            self.searchResult = result.coins
            self.viewModel.inputSearchTrigger.value = searchBar.text
        }
    }
}

extension SearchViewController: SearchResultTableViewCellDelegate {
    func favoriteButtonTapped(on cell: SearchResultTableViewCell) {
        guard let indexPath = searchView.tableView.indexPath(for: cell) else { return }
        let coin = viewModel.outputSearchResultData.value[indexPath.row]
        if cell.isFavorite {
            viewModel.saveToRealm(coin: coin)
        } else {
            viewModel.deleteFromRealm(coin: coin)
        }
    }
}
