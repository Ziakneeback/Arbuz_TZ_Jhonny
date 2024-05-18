//
//  CartView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct CartView: View {
    @Binding var cart: [Product]
    @State private var showCheckoutSheet = false
    @State private var isLoading = false
    
    private let freeDeliveryThreshold: Int = 8000

    var body: some View {
        VStack {
            if cart.isEmpty {
                Text("Cart is empty")
                    .font(.largeTitle)
                    .padding()
            } else {
                ScrollView {
                    ForEach(cart) { product in
                        HStack {
                            Image(product.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)

                            VStack(alignment: .leading) {
                                Text(product.name)
                                    .font(.headline)

                                Text("\(product.price) tg")
                                    .font(.subheadline)
                            }

                            Spacer()

                            Text(product.quantity)
                                .font(.subheadline)
                        }
                        .padding()
                    }
                    .onDelete(perform: removeItems)
                }
                .listStyle(InsetGroupedListStyle())

                if totalAmount() < freeDeliveryThreshold {
                    Text("Add \(freeDeliveryThreshold - totalAmount()) tg for free delivery!")
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                HStack {
                    Text("Total:")
                        .font(.title2)
                    Spacer()
                    Text("\(totalAmount()) tg")
                        .font(.title2)
                }
                .padding()

                Button(action: {
                    isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                        showCheckoutSheet = true
                    }
                }) {
                    Text("Go to checkout")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding()
                }
                .disabled(isLoading)
            }
        }
        .navigationTitle("Cart")
        .navigationBarItems(trailing: EditButton())
        .sheet(isPresented: $showCheckoutSheet) {
            CheckoutView()
        }
        .overlay(
            Group {
                if isLoading {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(2)
                }
            }
        )
    }

    func removeItems(at offsets: IndexSet) {
        cart.remove(atOffsets: offsets)
    }

    func totalAmount() -> Int {
        cart.reduce(0) { $0 + $1.price }
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
