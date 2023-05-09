//
//  Coin.swift
//  CryptoMomo
//
//  Created by Ignacio Muñoz Repetto on 2023-05-08.
//

import Foundation

struct CoinMarketResponse : Decodable {
    let data : [Coin]
}

struct Coin : Identifiable, Decodable {
    let id: Int
    let name : String
    let quote : Quote
    
    struct Quote : Decodable {
        let USD : USD
        
        struct USD : Decodable {
            let price : Double
        }
    }
}
