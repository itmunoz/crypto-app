//
//  Network.swift
//  CryptoMomo
//
//  Created by Ignacio Muñoz Repetto on 2023-05-08.
//

import SwiftUI

class Network: ObservableObject {
    @Published var coins: [Coin] = []
    
    func getCoins() {
        
        var apiKey: String {
          get {
            guard let filePath = Bundle.main.path(forResource: "Coinmarketcap-Info", ofType: "plist") else {
              fatalError("Couldn't find file 'Coinmarketcap-Info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
              fatalError("Couldn't find key 'API_KEY' in 'Coinmarketcap-Info.plist'.")
            }
            return value
          }
        }
    
        guard let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?sort=price&limit=10") else { fatalError("Missing URL") }

        var urlRequest = URLRequest(url: url)
        urlRequest.addValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decoded = try JSONDecoder().decode(CoinMarketResponse.self, from: data)
                        self.coins = decoded.data
                        
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
