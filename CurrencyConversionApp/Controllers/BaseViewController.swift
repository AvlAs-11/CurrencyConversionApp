//
//  BaseViewController.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 15.02.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    func showMessage(title: String = "Error", message: String = "Unknown error") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
