//
//  HomeView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct HomeView: View {
    
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
                                    
                                    ProductCard(product: product)
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        
                        Title(title: "Vertical")
                        
                        ForEach(products) { product in
                                HStack{
                                    ProductCard(product: product)
                                    ProductCard(product: product)
                                }
                            }
                        .padding(.top, 5)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
