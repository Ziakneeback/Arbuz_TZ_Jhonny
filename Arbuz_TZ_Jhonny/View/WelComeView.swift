//
//  WelComeView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 17.05.2024.
//

import SwiftUI

struct WelComeView: View {
    var body: some View {
        ZStack{
            Image("welcome")
                .resizable()
                .scaledToFit()
            VStack{
                Spacer()
                Spacer()
                
                Text("\nto my app")
                    .font(.largeTitle)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                Spacer()
                
                NavigationLink{
                    MainTabView()
                } label: {
                    RoundButton(title: "Get Started"){
                        
                    }
                }
                
                
                
                Spacer()
                    .frame(height: 60)
            }
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct WelComeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WelComeView()
        }
    }
}
