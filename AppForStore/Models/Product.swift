//
//  Product.swift
//  AppForStore
//
//  Created by Bema on 29/4/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Классические брюки", image: "image1", price: 69),
                   Product(name: "Черная юбка", image: "image2", price: 102),
                   Product(name: "Костюм классический", image: "image3", price: 210),
                   Product(name: "Костюм двойка", image: "image4", price: 103),
                   Product(name: "Мужские джинсы", image: "image5", price: 89),
                   Product(name: "Блуза женская", image: "image6", price: 29),
                   Product(name: "Красная двойка", image: "image7", price: 47),
                   Product(name: "Футболка оверсайз", image: "image8", price: 93),
                   Product(name: "Костюм спортивный", image: "image9", price: 102),
                   Product(name: "Джинсовые шорты", image: "image10", price: 91),
                   Product(name: "Мужская футболка", image: "image11", price: 219),
                   Product(name: "Осенняя жилетка", image: "image12", price: 75)

]
