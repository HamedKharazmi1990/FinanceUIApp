//
//  TransactionView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 14.01.26.
//

import SwiftUI

struct TransactionView: View {
    let imageName: String?
    let payTo: String
    let month: Int
    let day: Int
    let amount: Int
    let isExpense: Bool
    let isSystemIcon: Bool
    var body: some View {
        HStack {
            if let imageName = imageName {
                if !isSystemIcon {
                    Image(imageName)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .foregroundStyle(fontColor)
                        .frame(width: 30, height: 30)
                } else {
                    Image(systemName: imageName)
                        .foregroundStyle(fontColor)
                        .font(.title.bold())
                }
            }
            VStack(alignment: .leading, spacing: 7) {
                TextView(
                    text: payTo,
                    font: .title
                )
                if month >= 0 && month <= 12 {
                    let cal = Calendar.current
                    let monthName = cal.monthSymbols[month]
                    
                    TextView(
                        text: "\(monthName) \(day)",
                        font: .subheadline
                    )
                }
            }.padding(.horizontal)
            
            Spacer()
            
            Text("\(isExpense ? "-" : "+")$\(amount)")
                .foregroundStyle(fontColor)
                .font(.caption)
                
                
        }
        .padding()
        .background(darkBackground2)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

#Preview {
    VStack {
        TransactionView(
            imageName: hamburgerIcon,
            payTo: "KFC",
            month: 3,
            day: 20,
            amount: 2000,
            isExpense: true,
            isSystemIcon: false
        )
        
        TransactionView(
            imageName: "bolt",
            payTo: "Electric",
            month: 3,
            day: 20,
            amount: 2000,
            isExpense: true,
            isSystemIcon: true
        )
    }
}
