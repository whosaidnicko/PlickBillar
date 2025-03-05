//
//  BilbackView.swift
//  PlickBillar
//
//  Created by Nicolae Chivriga on 05/03/2025.
//

import SwiftUI


struct BilbackView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            vibrationtember(sila: .light)
            self.dismiss()
        } label: {
            Image("wibuzaowpback")
        }

    }
}
