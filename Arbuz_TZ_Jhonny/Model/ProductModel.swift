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



//let apple = Product(image: "apple", name: "apple", price: 1000, quantity: "kg")
//let bread = Product(image: "bread", name: "bread", price: 150, quantity: "pcs")

struct ProductModel_Previews: PreviewProvider {
    static var previews: some View {
        ProductModel()
    }
}
