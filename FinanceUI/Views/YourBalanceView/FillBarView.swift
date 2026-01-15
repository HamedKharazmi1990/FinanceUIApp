//
//  FillBarView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 15.01.26.
//

import SwiftUI

struct FillBarView: View {
    let barWidth: CGFloat = 8
    let month: String
    let percentage: CGFloat
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(month)
                    .foregroundStyle(fontColor)
                    .font(.caption)
                
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(darkBackground3)
                        .frame(width: barWidth, height: .infinity)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(purple2)
                        .frame(width: barWidth, height: geometry.size.height * percentage)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        darkBackground.ignoresSafeArea()
        FillBarView(month: "Jan", percentage: 0.6)
    }
}
