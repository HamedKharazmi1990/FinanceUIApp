//
//  YourCardsView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 14.01.26.
//

import SwiftUI

struct YourCardsView: View {
    let numActiveCard: Int
    let yourCardsFont: Font = .title3
    let numActiveCardsFont: Font = .caption
    let numActiveCardsFontWeight: Font.Weight = .thin
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                TextViewGeneral(
                    text: "Your Cards",
                    font: yourCardsFont,
                    fontWeight: .bold,
                    color: fontColor
                )
                
                TextViewGeneral(
                    text: "You have \(numActiveCard) Active Cards",
                    font: numActiveCardsFont,
                    fontWeight: numActiveCardsFontWeight,
                    color: fontColor
                )
            }
            
            Spacer()
            
            let plusDim: CGFloat = 50
            Image(systemName: "plus")
                .font(.body.weight(.heavy))
                .frame(width: plusDim, height: plusDim)
                .foregroundStyle(.darkBackground)
                .background(gold)
                .clipShape(Circle())
        }
        .padding()
        .background(darkBackground)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    YourCardsView(numActiveCard: 3)
}
