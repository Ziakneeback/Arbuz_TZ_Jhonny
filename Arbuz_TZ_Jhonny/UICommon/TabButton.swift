//
//  TabButton.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

struct TabButton: View {
    
    @State var title: String = "Title"
    @State var icon: String = "house"
    var isSelected: Bool = false
    var didSelect: (()->())?
    
    
    var body: some View {
        Button{
            debugPrint("Tap button")
            didSelect?()
        } label: {
            VStack{
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text(title)
            }
        }
        .foregroundColor(isSelected ? .secondary : .primary)
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton()
    }
}
