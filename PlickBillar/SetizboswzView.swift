//
//  SetizboswzView.swift
//  PlickBillar
//
//  Created by Nicolae Chivriga on 05/03/2025.
//

import SwiftUI
import StoreKit

struct SetizboswzView: View {
    var body: some View {
        ZStack {
            Color.init(hex: "#FFDE8C")
                .ignoresSafeArea()
            
            Image("setps")
                .resizable()
                .scaledToFit()
                .padding(10)
                .overlay {
                    Button {
                        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                            SKStoreReviewController.requestReview(in: scene)
                        }
                    } label: {
                        Image("butoncik")
                    }
                }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BilbackView())
    }
}
extension View {
    func sbuilekzxibp() -> some View {
        self.modifier(Wieozbuqapnmlas())
    }
}
