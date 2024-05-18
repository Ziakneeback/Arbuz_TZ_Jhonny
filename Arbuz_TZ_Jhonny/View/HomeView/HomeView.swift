//
//  HomeView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedProduct: Product? = nil
    @State private var showBottomSheet: Bool = false
    
    let products = [
        Product(name: "Banana", price: 1400, quantity: "7 pcs.", imageName: "banana"),
        Product(name: "Apple", price: 830, quantity: "1 kg.", imageName: "apples"),
        Product(name: "Snickers", price: 350, quantity: "1 pcs.", imageName: "snickers"),
        Product(name: "Twix", price: 350, quantity: "1 pcs.", imageName: "twix"),
        Product(name: "Coca-cola", price: 800, quantity: "1 pcs.", imageName: "cola"),
        Product(name: "Arbuz", price: 3000, quantity: "1 pcs.", imageName: "arbuz")
        ]
    
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                LinearGradient(colors: [.white, .yellow], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                LinearGradient(colors: [.yellow, .white], startPoint: .top, endPoint: .bottom)
            }
            VStack{
                Text("Arbuz.kz")
                    .font(.largeTitle.weight(.semibold))
                    .padding(.top, 50)
                ScrollView(showsIndicators: false){
                    VStack{
                        Title(title: "Horizontal")
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 10){
                                ForEach(products) { product in
                                    Button(action: {
                                        self.selectedProduct = product
                                        self.showBottomSheet = true
                                    }) {
                                        ProductCard(product: product)
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        
                        Title(title: "Vertical")
                        
                        ForEach(0..<products.count / 2) { index in
                                HStack{
                                    Button(action: {
                                        self.selectedProduct = products[index * 2]
                                        self.showBottomSheet = true
                                    }) {
                                        ProductCard(product: products[index * 2])
                                    }
                                    if index * 2 + 1 < products.count {
                                        Button(action: {
                                        self.selectedProduct = products[index * 2 + 1]
                                        self.showBottomSheet = true
                                        }) {
                                            ProductCard(product: products[index * 2 + 1])
                                        }
                                                        }
                                }
                            
                            if products.count % 2 != 0 {
                    HStack {
                        ProductCard(product: products[products.count - 1])
                        Spacer().frame(width: 150)
                    }
                                        }
                            }
                        .padding(.top, 5)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showBottomSheet) {
                    if let product = selectedProduct {
                        ProductDetailView(product: product, isPresented: $showBottomSheet)
                    }
                }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
