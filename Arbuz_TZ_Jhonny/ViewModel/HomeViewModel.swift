//
//  HomeViewModel.swift
//  Arbuz_TZ_Jhonny
//
//  Created by Жанибек Асылбек on 18.05.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var selectTab: Int = 0
}


