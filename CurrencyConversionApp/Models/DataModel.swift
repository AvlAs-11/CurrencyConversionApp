//
//  DataModel.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 10.02.2022.
//

import Foundation

struct DataModel: Codable {
    let newAmount: Double
    let newCurrency: String
    let oldCurrency: String
    let oldAmount: Int

    enum CodingKeys: String, CodingKey {
        case newAmount = "new_amount"
        case newCurrency = "new_currency"
        case oldCurrency = "old_currency"
        case oldAmount = "old_amount"
    }
}
