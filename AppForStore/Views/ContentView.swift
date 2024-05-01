//
//  ContentView.swift
//  AppForStore
//
//  Created by Bema on 29/4/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State private var isEditing = false
    @State private var editedName = ""
    @State private var editedPrice = ""
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                       ProductCard(product: product)
                                .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("KGmart Shop"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}

