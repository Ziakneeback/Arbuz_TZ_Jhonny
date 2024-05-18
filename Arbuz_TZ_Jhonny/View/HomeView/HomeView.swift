//
//  HomeView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            VStack{
                Text("Arbuz.kz")
                    .font(.largeTitle)
                    .padding(.top, 50)
                ScrollView{
                    VStack{
                        Title(title: "Horizontal")
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 10){
                                ForEach(0...5, id: \.self){index in
                                    
                                    ProductCard{}
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        
                        Title(title: "Vertical")
                        
                        ForEach(0...5, id: \.self){index in
                            HStack{
                                ProductCard{}
                                ProductCard{}
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
