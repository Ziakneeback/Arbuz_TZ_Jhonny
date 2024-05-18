//
//  ProductDetailView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .cornerRadius(8)
                .padding()

            Text(product.name)
                .font(.title)
                .padding(.top, 16)

            Text("Цена: \(product.price) руб.")
                .font(.title2)
                .foregroundColor(.green)
                .padding(.top, 8)

            Text("Количество: \(product.quantity)")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 8)

            Button(action: {
                // Действие при добавлении в корзину
                isPresented = false
            }) {
                Text("Добавить в корзину")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 16)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 8)
        .padding(.all, 16)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(name: "Название товара", price: 1000, quantity: "2 шт.", imageName: "image_name"), isPresented: .constant(true))
    }
}

