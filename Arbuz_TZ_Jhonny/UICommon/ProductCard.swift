//
//  ProductCard.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

struct ProductCard: View {
    
   @State private var isFav: Bool = false
//    let product: Product

    var didAddCart: (()->())?
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                    Image("banana")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 100)
                        .padding(.top)
                        .cornerRadius(15)
                    
                
                
                Text("Banana")
                    .padding(.top)
                HStack{
                    Text("565 tg")
                    Text("*")
                    Text("1 pcs")
                }
                Button{
                    didAddCart?()
                } label:{
                    HStack{
                        Text("565 tg")
                        Image(systemName: "plus")
                    }
                }
                .padding(3)
                .foregroundColor(Color.primary)
                .background(Color.green)
                .cornerRadius(20)
                
                
            }
            .frame(width: 180, height: 230)
            
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.green, lineWidth: 4)
            )
            
            Button{
                self.isFav.toggle()
            } label:{
                Image(systemName: isFav ? "heart.fill" : "heart")
            }
            .foregroundColor(Color.red)
            .frame(width: 40, height: 30)
            .padding(.top, 7)
            .padding(.horizontal, 5)
        }
    }
    
    
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard()
    }
}
