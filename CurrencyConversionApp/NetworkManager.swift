//
//  NetworkManager.swift
//  CurrencyConversionApp
//
//  Created by Pavel Avlasov on 10.02.2022.
//

import Foundation

final class NetworkManager {
    
    static func loadRate(with firstCode: String, secondCode: String, completion: @escaping (Result<DataModel, Error>) -> Void)  {
        
        let headers = [
            "x-rapidapi-host": "currency-converter-by-api-ninjas.p.rapidapi.com",
            "x-rapidapi-key": "ef06c2a322mshbf430dd4f199d19p17f5adjsn53ae597b824e"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://currency-converter-by-api-ninjas.p.rapidapi.com/v1/convertcurrency?have=\(firstCode)&want=\(secondCode)&amount=100")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(DataModel.self, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
