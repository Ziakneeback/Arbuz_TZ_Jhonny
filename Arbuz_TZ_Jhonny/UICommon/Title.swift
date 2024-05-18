//
//  Title.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

struct Title: View {
    
    @State var title: String = "Title"
    var body: some View {
        HStack{
            Text(title)
                .font(.largeTitle)
          Spacer()
        }
        .padding(.horizontal)
        
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
    }
}
