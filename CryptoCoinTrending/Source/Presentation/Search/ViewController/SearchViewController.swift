//
//  SearchViewController.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/1/24.
//

import UIKit

final class SearchViewController: BaseViewController {

    private let searchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configView() {
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        searchView.tableView.rowHeight = 60
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as! SearchResultTableViewCell
        
        return cell
    }
}
