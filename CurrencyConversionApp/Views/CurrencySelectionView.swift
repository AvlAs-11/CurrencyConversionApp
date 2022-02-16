//
//  CurrencySelectionView.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 10.02.2022.
//

import UIKit

class CurrencySelectionView: UIView {
    
    lazy var availibleCurrencyTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    lazy var currencySearchBar: UITextField = {
        let bar = UITextField()
        bar.placeholder = "Search"
        return bar
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.tintColor, for: .normal)
        button.setTitle("Back", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backButton)
        addSubview(availibleCurrencyTableView)
        addSubview(currencySearchBar)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configuration() {
        self.backgroundColor = .systemBackground
        backButton.translatesAutoresizingMaskIntoConstraints = false
        availibleCurrencyTableView.translatesAutoresizingMaskIntoConstraints = false
        currencySearchBar.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        currencySearchBar.topAnchor.constraint(equalTo: backButton.bottomAnchor).isActive = true
        currencySearchBar.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        currencySearchBar.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        currencySearchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        availibleCurrencyTableView.topAnchor.constraint(equalTo: currencySearchBar.bottomAnchor, constant: 10).isActive = true
        availibleCurrencyTableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        availibleCurrencyTableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        availibleCurrencyTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}




