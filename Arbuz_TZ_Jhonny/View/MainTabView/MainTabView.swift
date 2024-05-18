//
//  MainTabView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var homeVM = HomeViewModel.shared
    @State private var cart: [Product] = []
    var body: some View {
        VStack{
            
            TabView(selection: $homeVM.selectTab){
                HomeView(cart: $cart).tag(0)
                CartView(cart: $cart).tag(1)
                
            }
            .onAppear{
                UIScrollView.appearance().isScrollEnabled = false
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeVM.selectTab){ newValue in
                debugPrint("Selected Tab:\(newValue)")
            }
            
            HStack{
                
                Spacer()
                
                TabButton(title: "Main", icon: "house", isSelected: homeVM.selectTab == 0){
                   
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectTab = 0
                        }
                    }
                }
                
                Spacer()
                
                TabButton(title: "Cart", icon: "cart", isSelected: homeVM.selectTab == 1){
                    DispatchQueue.main.async {
                        withAnimation{
                            homeVM.selectTab = 1
                        }
                    }
                }
                
               
                
                Spacer()
                
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
            
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
