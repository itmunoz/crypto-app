//
//  CryptoMomoApp.swift
//  CryptoMomo
//
//  Created by Ignacio Muñoz Repetto on 2023-05-08.
//

import SwiftUI

@main
struct CryptoMomoApp: App {
    var network = Network()
    
    init() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { result, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}
