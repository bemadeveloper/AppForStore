//
//  ProductCart.swift
//  AppForStore
//
//  Created by Bema on 29/4/24.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var isEditing = false
    @State private var editedName = ""
    @State private var editedPrice = ""
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink(destination: DetailProduct(product: product)) {
                ZStack(alignment: .bottom) {
                    Image(product.image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                    
                    VStack(alignment: .leading) {
                        Text(product.name)
                            .bold()
                        
                        Text("\(product.price)$")
                            .font(.caption)
                    }
                    .padding()
                    .frame(width: 180, alignment: .leading)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
                .frame(width: 180, height: 250)
                .shadow(radius: 3)
            }
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            }
            
//            Button(action: {
//                EditProductView(product: product)
//            }) {
//                Image(systemName: "square.and.pencil")
//                    .padding(10)
//                    .foregroundColor(.white)
//                    .background(.black)
//                    .cornerRadius(50)
//                    .padding(.bottom, 20)
//            }
            
        }
    }

}

#Preview {
    ProductCard(product: productList[0])
        .environmentObject(CartManager())
}


