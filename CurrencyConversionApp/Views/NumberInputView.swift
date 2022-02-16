//
//  View.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 10.02.2022.
//

import UIKit

class NumberInputView: UIView {
    
    lazy var firstField: UITextField = {
        lazy var field = UITextField()
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 10
        field.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        field.backgroundColor = .systemGray
        field.textColor = .systemBackground
        return field
    }()
    
    lazy var firstCountryIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BYNIcon")
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    lazy var firstCurrencyCode: UILabel = {
        let label = UILabel()
        label.text = "BYN"
        return label
    }()
    
    lazy var firstChangeCurrencyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBackground, for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Change cyrrency", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemGray
        return button
    }()
    
    lazy var secondField: UITextField = {
        let field = UITextField()
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        field.layer.borderWidth = 2
        field.layer.cornerRadius = 10
        field.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        field.backgroundColor = .systemGray
        field.textColor = .systemBackground
        return field
    }()
    
    lazy var secondCountryIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "USDIcon")
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()
    
    lazy var secondCurrencyCode: UILabel = {
        let label = UILabel()
        label.text = "USD"
        return label
    }()
    
    lazy var secondChangeCurrencyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemGray
        button.titleLabel?.numberOfLines = 0
        button.setTitle("Change cyrrency", for: .normal)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading exchange rates...."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(firstField)
        addSubview(secondField)
        addSubview(firstCountryIcon)
        addSubview(secondCountryIcon)
        addSubview(firstCurrencyCode)
        addSubview(secondCurrencyCode)
        addSubview(firstChangeCurrencyButton)
        addSubview(secondChangeCurrencyButton)
        addSubview(loadingLabel)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        firstField.translatesAutoresizingMaskIntoConstraints = false
        secondField.translatesAutoresizingMaskIntoConstraints = false
        firstCountryIcon.translatesAutoresizingMaskIntoConstraints = false
        secondCountryIcon.translatesAutoresizingMaskIntoConstraints = false
        firstCurrencyCode.translatesAutoresizingMaskIntoConstraints = false
        secondCurrencyCode.translatesAutoresizingMaskIntoConstraints = false
        firstChangeCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        secondChangeCurrencyButton.translatesAutoresizingMaskIntoConstraints = false
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
        firstField.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
        firstField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        firstField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        secondField.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 10).isActive = true
        secondField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        secondField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        secondField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        firstCountryIcon.centerYAnchor.constraint(equalTo: firstField.centerYAnchor).isActive = true
        firstCountryIcon.leftAnchor.constraint(equalTo: firstField.rightAnchor, constant: 5).isActive = true
        firstCountryIcon.heightAnchor.constraint(equalTo: firstField.heightAnchor, multiplier: 0.9).isActive = true
        firstCountryIcon.widthAnchor.constraint(equalTo: firstField.widthAnchor, multiplier: 1/2).isActive = true
        secondCountryIcon.centerYAnchor.constraint(equalTo: secondField.centerYAnchor).isActive = true
        secondCountryIcon.leftAnchor.constraint(equalTo: secondField.rightAnchor, constant: 5).isActive = true
        secondCountryIcon.heightAnchor.constraint(equalTo: secondField.heightAnchor, multiplier: 0.9).isActive = true
        secondCountryIcon.widthAnchor.constraint(equalTo: secondField.widthAnchor, multiplier: 1/2).isActive = true
        firstCurrencyCode.centerYAnchor.constraint(equalTo: firstField.centerYAnchor).isActive = true
        firstCurrencyCode.leftAnchor.constraint(equalTo: firstCountryIcon.rightAnchor, constant: 5).isActive = true
        firstCurrencyCode.heightAnchor.constraint(equalTo: firstField.heightAnchor).isActive = true
        firstCurrencyCode.widthAnchor.constraint(equalTo: firstField.widthAnchor, multiplier: 1/2).isActive = true
        secondCurrencyCode.centerYAnchor.constraint(equalTo: secondField.centerYAnchor).isActive = true
        secondCurrencyCode.leftAnchor.constraint(equalTo: secondCountryIcon.rightAnchor, constant: 5).isActive = true
        secondCurrencyCode.heightAnchor.constraint(equalTo: secondField.heightAnchor).isActive = true
        secondCurrencyCode.widthAnchor.constraint(equalTo: secondField.widthAnchor, multiplier: 1/2).isActive = true
        firstChangeCurrencyButton.centerYAnchor.constraint(equalTo: firstField.centerYAnchor).isActive = true
        firstChangeCurrencyButton.leftAnchor.constraint(equalTo: firstCurrencyCode.rightAnchor, constant: 5).isActive = true
        firstChangeCurrencyButton.heightAnchor.constraint(equalTo: firstField.heightAnchor).isActive = true
        firstChangeCurrencyButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
        secondChangeCurrencyButton.centerYAnchor.constraint(equalTo: secondField.centerYAnchor).isActive = true
        secondChangeCurrencyButton.leftAnchor.constraint(equalTo: secondCurrencyCode.rightAnchor, constant: 5).isActive = true
        secondChangeCurrencyButton.heightAnchor.constraint(equalTo: secondField.heightAnchor).isActive = true
        secondChangeCurrencyButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
        loadingLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        loadingLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
