//
//  SearchView.swift
//  CryptoCoinTrending
//
//  Created by hwijinjeong on 3/2/24.
//

import UIKit
import SnapKit
import Then

final class SearchView: UIView {
    let titleLabel = UILabel().then {
        $0.text = "Search"
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 28)
        $0.textAlignment = .left
    }
    
    let searchBar = UISearchBar().then {
        $0.barTintColor = .white
        $0.placeholder = "Enter a search term"
        $0.backgroundImage = UIImage()
        $0.searchTextField.leftView?.tintColor = .darkGray
        $0.searchTextField.textColor = .black
        
        if let searchTextField = $0.value(forKey: "searchField") as? UITextField {
            let placeholderText = NSAttributedString(string: "Enter a search term", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            searchTextField.attributedPlaceholder = placeholderText
            
            if let clearButton = searchTextField.value(forKey: "_clearButton") as? UIButton {
                clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
                clearButton.tintColor = .darkGray
            }
        }
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
            searchBar,
            tableView
        ])
        
        tableView.backgroundColor = .clear
        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
        }
        
        searchBar.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(12)
            $0.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}
