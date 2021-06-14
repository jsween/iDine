//
//  Favorites.swift
//  iDine
//
//  Created by Jonathan Sweeney on 6/14/21.
//

import SwiftUI

class Favorites: ObservableObject {
    @Published var items = [MenuItem]()

    func add(item: MenuItem) {
        items.append(item)
    }

    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
