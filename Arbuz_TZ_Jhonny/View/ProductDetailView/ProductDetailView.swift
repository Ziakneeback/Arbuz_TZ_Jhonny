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
    var addToCart: (Product) -> Void

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

            Text("Price: \(product.price) tg.")
                .font(.title2)
                .foregroundColor(.green)
                .padding(.top, 8)

            Text("Quantity: \(product.quantity)")
                .font(.body)
                .foregroundColor(.gray)
                .padding(.top, 8)

            Button(action: {
                addToCart(product)
                isPresented = false
            }) {
                Text("Add to cart")
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
        ProductDetailView(product: Product(name: "Banana", price: 1400, quantity: "7 pcs.", imageName: "banana"), isPresented: .constant(true), addToCart: { _ in })
    }
}


