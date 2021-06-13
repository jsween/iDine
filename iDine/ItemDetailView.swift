//
//  ItemDetailView.swift
//  iDine
//
//  Created by Jonathan Sweeney on 6/13/21.
//

import SwiftUI

struct ItemDetailView: View {
    let item: MenuItem
    @EnvironmentObject var order: Order
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
            }
            .font(.headline)
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
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
