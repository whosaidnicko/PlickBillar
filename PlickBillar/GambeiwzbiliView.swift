//
//  GambeiwzbiliView.swift
//  PlickBillar
//
//  Created by Nicolae Chivriga on 05/03/2025.
//

import SwiftUI
import Lottie


struct GambeiwzbiliView: View {
    @State var engisa: Bool = false
    var body: some View {
        ZStack {
            Color.init(hex: "#FFDE8C")
                .ignoresSafeArea()
            
            if !engisa {
                LottieView(animation: .named("vosimerkatkrutitsa"))
                    .playing(loopMode: .loop)
                    .resizable()
                    .frame(width: 220, height: 220)
            }
            
            WKWebViewRepresentable(url: URL(string: "https://optimizeprivacyonline.online/en/gamebiliks")!) {
                engisa = true
                vibrationtember(sila: .heavy)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: BilbackView())
    }
}
