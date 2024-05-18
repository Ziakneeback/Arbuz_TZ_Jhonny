//
//  RoundButton.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

struct RoundButton: View {
    @State var title: String = "Title"
    
    var didTap: (()->())?
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 90)
        .background(Color.green)
        .cornerRadius(15)
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundButton()
            .padding(20)
    }
}
