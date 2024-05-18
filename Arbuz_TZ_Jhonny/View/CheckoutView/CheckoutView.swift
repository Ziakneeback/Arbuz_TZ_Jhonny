//
//  CheckoutView.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Hello World!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Close")
                    .font(.title2)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding()
            }
        }
        .padding()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
