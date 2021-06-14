//
//  MainView.swift
//  iDine
//
//  Created by Jonathan Sweeney on 6/13/21.
//

import SwiftUI

struct MainView: View {
    let order: Order = Order()
    let favorites: Favorites = Favorites()
    var body: some View {
        TabView {
            ContentView()
                .environmentObject(order)
                .environmentObject(favorites)
                .tabItem {
                        Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .environmentObject(order)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            FavoritesView()
                .environmentObject(order)
                .environmentObject(favorites)
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
                
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
