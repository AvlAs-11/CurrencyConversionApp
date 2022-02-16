//
//  CurrencySelectionViewController.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 10.02.2022.
//

import UIKit

class CurrencySelectionViewController: BaseViewController {
    
    let iconDictionary = ["USD": "USDIcon", "RUB": "RUBIcon", "BYN": "BYNIcon", "EUR": "EURIcon"]
    var availableCurrenciesArray = ["USD", "RUB", "BYN", "EUR"]
    var currencySelectionView = CurrencySelectionView()
    var numberOfField: FieldNumberEnum?
    var previousSearchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    private func configuration() {
        let frame = view.frame
        currencySelectionView = CurrencySelectionView(frame: frame)
        view.addSubview(currencySelectionView)
        let nib = UINib(nibName: "AvailibleCurrencyTableViewCell", bundle: nil)
        currencySelectionView.availibleCurrencyTableView.register(nib, forCellReuseIdentifier: "AvailibleCurrencyTableViewCell")
        currencySelectionView.availibleCurrencyTableView.delegate = self
        currencySelectionView.availibleCurrencyTableView.dataSource = self
        currencySelectionView.currencySearchBar.delegate = self
        currencySelectionView.backButton.addTarget(self, action: #selector(backToMainController), for: .touchUpInside)
    }
    
    @objc private func backToMainController() {
        navigationController?.popViewController(animated: true)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async { [self] in
            currencySelectionView.frame = self.view.bounds
        }
    }
}

extension CurrencySelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableCurrenciesArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvailibleCurrencyTableViewCell", for: indexPath) as! AvailibleCurrencyTableViewCell
        cell.configuration(with: availableCurrenciesArray[indexPath.row], dictionary: iconDictionary)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch numberOfField {
        case .firstField:
            if availableCurrenciesArray[indexPath.row] == NumberInputViewController.selectedCyrrencyCode2 {
                showMessage(message: "You have selected the same currency")
                return
            }
            NumberInputViewController.selectedCyrrencyCode1 = availableCurrenciesArray[indexPath.row]
        case .secondField:
            if availableCurrenciesArray[indexPath.row] == NumberInputViewController.selectedCyrrencyCode1 {
                showMessage(message: "You have selected the same currency")
                return
            }
            NumberInputViewController.selectedCyrrencyCode2 = availableCurrenciesArray[indexPath.row]
        case .none:
            break
        }
        navigationController?.popViewController(animated: true)
    }
}

extension CurrencySelectionViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField.text?.count != previousSearchText.count {
            availableCurrenciesArray = ["USD", "RUB", "BYN", "EUR"]
        }
        
        var sortedArray = [String]()
        
        if textField.text == "" {
            availableCurrenciesArray = ["USD", "RUB", "BYN", "EUR"]
            currencySelectionView.availibleCurrencyTableView.reloadData()
            return
        }
        
        guard var text = textField.text else { return }
        
        text = text.uppercased()
        
        for i in availableCurrenciesArray {
            if i.contains(text) {
                sortedArray.append(i)
            }
        }
        availableCurrenciesArray = sortedArray
        currencySelectionView.availibleCurrencyTableView.reloadData()
        previousSearchText = textField.text!
    }
}
