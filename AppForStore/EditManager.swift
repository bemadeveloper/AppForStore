//
//  EditManager.swift
//  AppForStore
//
//  Created by Bema on 30/4/24.
//

import Foundation

class EditManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    func changeName(for product: Product, newName: String) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
                    products[index].name = newName
                }
    }
    
    func changeBrand(for product: Product, newBrand: String) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
                    products[index].brand = newBrand
                }
    }
}
