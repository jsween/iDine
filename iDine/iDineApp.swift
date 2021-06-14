//
//  iDineApp.swift
//  iDine
//
//  Created by Jonathan Sweeney on 6/11/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    @StateObject var favorites = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(favorites)
        }
    }
}
