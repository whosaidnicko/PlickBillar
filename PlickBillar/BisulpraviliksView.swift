//
//  BisulpraviliksView.swift
//  PlickBillar
//
//  Created by Nicolae Chivriga on 05/03/2025.
//

import SwiftUI

struct BisulpraviliksView: View {
    var body: some View {
        ZStack {
            Color.init(hex: "#FFDE8C")
                .ignoresSafeArea()
            
            Image("rultext")
                .resizable()
                .scaledToFit()
                .padding(21)
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BilbackView())
    }
}
