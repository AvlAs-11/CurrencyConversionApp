//
//  ViewController.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 09.02.2022.
//

import UIKit

class NumberInputViewController: BaseViewController {
    
    var numberInputView = NumberInputView()
    static var selectedCyrrencyCode1 = "BYN"
    static var selectedCyrrencyCode2 = "USD"
    static var selectedField = 1
    var availibleCurrencyToFirstField: Double = 1
    var availibleCurrencyToSecondField: Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setCurrencyCode()
        setCurrencyIcon()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setDefaultRate()
    }
    
    private func configuration() {
        let frame = view.frame
        numberInputView = NumberInputView(frame: frame)
        view.addSubview(numberInputView)
        numberInputView.firstChangeCurrencyButton.addTarget(self, action: #selector(toCurrencyListFirstButton), for: .touchUpInside)
        numberInputView.secondChangeCurrencyButton.addTarget(self, action: #selector(toCurrencyListSecondButton), for: .touchUpInside)
        numberInputView.firstField.delegate = self
        numberInputView.secondField.delegate = self
    }
    
    @objc private func toCurrencyListFirstButton() {
        toCurrencyListController(numberOfField: .firstField)
    }
    
    @objc private func toCurrencyListSecondButton() {
        toCurrencyListController(numberOfField: .secondField)
    }
    
    func toCurrencyListController(numberOfField: FieldNumberEnum) {
        let currencySelectorViewController = CurrencySelectionViewController()
        currencySelectorViewController.numberOfField = numberOfField
        let navi = navigationController
        navi?.pushViewController(currencySelectorViewController, animated: true)
    }
    
    private func setCurrencyCode() {
        numberInputView.firstCurrencyCode.text = NumberInputViewController.selectedCyrrencyCode1
        numberInputView.secondCurrencyCode.text = NumberInputViewController.selectedCyrrencyCode2
    }
    
    private func setCurrencyIcon() {
        numberInputView.firstCountryIcon.image = UIImage(named: NumberInputViewController.selectedCyrrencyCode1 + "Icon")
        numberInputView.secondCountryIcon.image = UIImage(named: NumberInputViewController.selectedCyrrencyCode2 + "Icon")
    }
    
    private func setDefaultRate() {
        numberInputView.loadingLabel.isHidden = false
        let firstCode = NumberInputViewController.selectedCyrrencyCode1
        let secondCode = NumberInputViewController.selectedCyrrencyCode2
        NetworkManager.loadRate(with: firstCode, secondCode: secondCode) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.availibleCurrencyToSecondField = Double(data.newAmount) / 100
                self.availibleCurrencyToFirstField = 1 / self.availibleCurrencyToSecondField
                DispatchQueue.main.async {
                    self.numberInputView.firstField.text = "1"
                    self.numberInputView.secondField.text = String(format: "%.2f", self.availibleCurrencyToSecondField)
                    self.numberInputView.loadingLabel.isHidden = true
                }
            case .failure(let error):
                self.showMessage(message: error.localizedDescription)
            }
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        DispatchQueue.main.async { [self] in
            numberInputView.frame = self.view.bounds
        }
    }
}

extension NumberInputViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {        
        if numberInputView.firstField.isEditing {
            guard var stringNumber = numberInputView.firstField.text else { return }
            let enteredNumber = Double(stringNumber)
            guard var temp = enteredNumber else { return }
            temp = temp * availibleCurrencyToSecondField
            stringNumber = String(format: "%.2f", temp)
            numberInputView.secondField.text = stringNumber
        }
        
        if numberInputView.secondField.isEditing {
            guard var stringNumber = numberInputView.secondField.text else { return }
            let enteredNumber = Double(stringNumber)
            guard var temp = enteredNumber else { return }
            temp = temp * availibleCurrencyToFirstField
            stringNumber = String(format: "%.2f", temp)
            numberInputView.firstField.text = stringNumber
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.numberInputView.firstField.text = ""
        self.numberInputView.secondField.text = ""
    }
}

