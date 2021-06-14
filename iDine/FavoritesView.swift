//
//  FavoritesView.swift
//  iDine
//
//  Created by Jonathan Sweeney on 6/14/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    var body: some View {
        NavigationView {
            if favorites.items.isEmpty {
                Text("No favorites yet. Start eating!")
                    .navigationTitle("Favorites")
            } else {
                List {
                    ForEach(favorites.items) { item in
                        Text(item.name)
                    }
                    .onDelete(perform: deleteItem)
                }
                .navigationTitle("Favorites")
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
