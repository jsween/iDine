//
//  ItemDetailView.swift
//  iDine
//
//  Created by Jonathan Sweeney on 6/13/21.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    let impactMed = UIImpactFeedbackGenerator(style: .medium)
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                if #available(iOS 15.0, *) {
                    Text("Photo: \(item.photoCredit)")
                        .padding()
                        .background(Color.black)
                        .opacity(0.7)
                        .font(.caption)
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                } else {
                    // Fallback on earlier versions
                    Text("Photo: \(item.photoCredit)")
                        .padding()
                        .font(.caption)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 6, x: 3, y: 3)
                        .offset(x: -5, y: -5)
                }
            }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
                impactMed.impactOccurred()
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            .animation(.easeOut(duration: 0.5))
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: {
                favorites.items.contains(item) ? favorites.remove(item: item) : favorites.add(item: item)
            }) {
                favorites.items.contains(item) ? Image(systemName: "heart.fill") : Image(systemName: "heart")
            }
        }
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetailView(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
