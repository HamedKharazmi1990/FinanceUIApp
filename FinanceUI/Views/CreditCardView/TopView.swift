//
//  TopView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 14.01.26.
//

import SwiftUI

struct TopView: View {
    let dim: CGFloat = 50
    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .font(.body.weight(.heavy))
                .frame(width: dim, height: dim)
                .foregroundStyle(fontColor)
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .font(.body.weight(.heavy))
                .frame(width: dim, height: dim)
                .foregroundStyle(fontColor)
                .rotationEffect(.degrees(90))
        }
        .padding()
        .background(darkBackground)
    }
}

#Preview {
    TopView()
}
