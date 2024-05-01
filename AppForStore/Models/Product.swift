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
    var descriton: String?
    var brand: String?
    
}

var productList = [Product(name: "Классические брюки", image: "image1", price: 69, descriton: "Брюки женские на широком поясе, брючина классическая прямая. Покупая у нас брюки на широком поясе, клеш от колена, вы получаете удобный и практичный пример того, что качественная классическая одежда может быть недорогой.", brand: "LoremIpsum"),
                   Product(name: "Черная юбка", image: "image2", price: 102, descriton: "Черная юбка с высокой талией и классическим кроем. Изготовлена из качественного материала, который приятен на ощупь и хорошо держит форму. Идеальный выбор для создания элегантного и стильного образа", brand: "Zara"),
                   Product(name: "Костюм классический", image: "image3", price: 210, descriton: "Офисный костюм представляет собой стильное и элегантное сочетание пиджака и брюк. Пиджак имеет классический крой с акцентом на стройную фигуру.", brand: "Gucci"),
                   Product(name: "Костюм двойка", image: "image4", price: 103, descriton: "Женский костюм двойка с топом - это элегантный и стильный набор, который подходит как для деловых мероприятий, так и для повседневной носки в офисе.", brand: "H&m"),
                   Product(name: "Мужские джинсы", image: "image5", price: 89),
                   Product(name: "Блуза женская", image: "image6", price: 29),
                   Product(name: "Красная двойка", image: "image7", price: 47),
                   Product(name: "Футболка оверсайз", image: "image8", price: 93),
                   Product(name: "Костюм спортивный", image: "image9", price: 102),
                   Product(name: "Джинсовые шорты", image: "image10", price: 91),
                   Product(name: "Мужская футболка", image: "image11", price: 219),
                   Product(name: "Осенняя жилетка", image: "image12", price: 75)

]
