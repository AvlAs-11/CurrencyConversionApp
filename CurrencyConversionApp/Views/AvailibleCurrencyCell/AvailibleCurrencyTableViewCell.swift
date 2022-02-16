//
//  TableViewCell.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 10.02.2022.
//

import UIKit

class AvailibleCurrencyTableViewCell: UITableViewCell {
    
    lazy var currencyCodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var currencyIconImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor(named: "BorderColor")?.cgColor
        image.layer.borderWidth = 2
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(currencyCodeLabel)
        addSubview(currencyIconImage)
        setAnchors()
    }
    
    func configuration(with currencyCode: String, dictionary: [String: String]) {
        currencyCodeLabel.text = currencyCode
        currencyIconImage.image = UIImage(named: dictionary[currencyCode]!)
    }
    
    private func setAnchors() {
        currencyCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        currencyIconImage.translatesAutoresizingMaskIntoConstraints = false
        currencyCodeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        currencyCodeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        currencyCodeLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        currencyIconImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        currencyIconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        currencyIconImage.heightAnchor.constraint(equalToConstant: 60).isActive = true
        currencyIconImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
