//
//  CreditCardPageView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 09.01.26.
//

import SwiftUI

struct CreditCardPageView: View {
    var body: some View {
        ZStack {
            darkBackground
                .ignoresSafeArea()
            
            VStack {
                YourCardsView(numActiveCard: 3)
                
                CreditCardView(
                    creditCardNumber: "4576 1144 6433 8212",
                    name: "Hamed Kharazmi",
                    expiryMonth: 10,
                    expiryYear: 2030)
                
                VStack(alignment: .leading, spacing: 0) {
                    TextView(text: "Recent Transactions", font: .title)
                }
            }
        }
    }
}

#Preview {
    CreditCardPageView()
}
