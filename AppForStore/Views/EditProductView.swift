//
//  EditProductView.swift
//  AppForStore
//
//  Created by Bema on 29/4/24.
//

import SwiftUI

struct EditProductView: View {
    @State private var editedName: String
    @State private var editedPrice: String
    @State private var editedDescription: String
    
    var product: Product
    
    
    init(product: Product) {
        _product = product
        _editedName = State(initialValue: product.wrappedValue.name)
        _editedPrice = State(initialValue: "\(product.wrappedValue.price)")
        _editedDescription = State(initialValue: product.wrappedValue.descriton ?? "")
    }
    
    var body: some View {
        VStack {
            TextField("Product Name", text: $editedName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Product Price", text: $editedPrice)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
            TextField("Product Description", text: $editedDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Save Changes") {
                // Update the product with edited data
                self.product.name = self.editedName
                if let price = Int(self.editedPrice) {
                    self.product.price = price
                }
                self.product.descriton = self.editedDescription
                
                // Perform other actions like saving changes
            }
            .padding()
        }
        .padding()
    }
}

struct ProductRowView: View {
    var product: Product

    var body: some View {
        VStack {
            Text("Product Name: \(product.name)")
            TextField("Price", value: $product.price, formatter: NumberFormatter())
            // Other fields for editing
        }
    }
}



#Preview {
    EditProductView(product: product)
        .environmentObject(CartManager())
}
