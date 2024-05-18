//
//  ProductModel.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI
import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
    let quantity: String
    let imageName: String
}
struct ProductModel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}



//let apple = Product(image: "apple", name: "Яблоко", price: 1.99, unit: "кг")
//let bread = Product(image: "bread", name: "Хлеб", price: 0.99, unit: "шт")

struct ProductModel_Previews: PreviewProvider {
    static var previews: some View {
        ProductModel()
    }
}
