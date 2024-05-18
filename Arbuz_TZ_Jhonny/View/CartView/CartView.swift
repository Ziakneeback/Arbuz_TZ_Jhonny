//
//  CartView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct CartView: View {
    @Binding var cart: [Product]

    var body: some View {
            VStack {
                if cart.isEmpty {
                    Text("Cart is empty")
                        .font(.largeTitle)
                        .padding()
                } else {
                    List {
                        ForEach(cart) { product in
                            HStack {
                                Image(product.imageName)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(product.name)
                                        .font(.headline)

                                    Text("\(product.price, specifier: "%.2f") tg")
                                        .font(.subheadline)
                                }

                                Spacer()

                                Text(product.quantity)
                                    .font(.subheadline)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Корзина")
            .navigationBarItems(trailing: EditButton())
        
    }

    func removeItems(at offsets: IndexSet) {
        cart.remove(atOffsets: offsets)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cart: .constant([
            Product(name: "Banana", price: 1400, quantity: "7 pcs.", imageName: "banana"),
            Product(name: "Apple", price: 830, quantity: "1 kg.", imageName: "apples")
        ]))
    }
}
