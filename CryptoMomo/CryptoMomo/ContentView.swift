//
//  ContentView.swift
//  CryptoMomo
//
//  Created by Ignacio Muñoz Repetto on 2023-05-08.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var network: Network

    var body: some View {
        ScrollView {
            Text("Top Crypto Coins")
                .font(.title)
                .bold()
            
            VStack(alignment: .leading) {
                ForEach(network.coins) { coin in
                    CoinStack(coin: coin)
                }
            }
        }
        .padding(.vertical)
        .onAppear {
            network.getCoins()
            network.getBitcoinValue()
        }
    }
}

struct CoinStack: View {
    var coin: Coin

    var body: some View {
        HStack(alignment:.top) {
            VStack(alignment: .leading) {
                Text(coin.name)
                    .bold()
                Text("$\(coin.quote.USD.price) USD")
            }
        }
        .frame(width: 300, alignment: .leading)
        .padding()
        .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
        .cornerRadius(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}
