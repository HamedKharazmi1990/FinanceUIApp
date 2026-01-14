//
//  CreditCardPageView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 09.01.26.
//

import SwiftUI

struct CreditCardPageView: View {
    
    let transactions: [(imageName: String?, payTo: String, month: Int, day: Int, amount: Int, isExpense: Bool, isSystemIcon: Bool)] = [
        (
            imageName: hamburgerIcon,
            payTo: "KFC",
            month: 3,
            day: 20,
            amount: 2010,
            isExpense: true,
            isSystemIcon: false
        ),
        (
            imageName: paypalIcon,
            payTo: "Paypal",
            month: 6,
            day: 28,
            amount: 12000,
            isExpense: true,
            isSystemIcon: false
        ),
        (
            imageName: wrenchIcon,
            payTo: "Car Repair",
            month: 8,
            day: 12,
            amount: 3450,
            isExpense: true,
            isSystemIcon: false
        ),
        (
            imageName: "dollarsign.circle",
            payTo: "Win Prize",
            month: 3,
            day: 24,
            amount: 1000000,
            isExpense: false,
            isSystemIcon: true
        )
    ]
    
    var body: some View {
        ZStack {
            darkBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                TopView()
                
                YourCardsView(numActiveCard: transactions.count)
                
                CreditCardView(
                    creditCardNumber: "4576 1144 6433 8212",
                    name: "Hamed Kharazmi",
                    expiryMonth: 10,
                    expiryYear: 2030)
                
                TextView(
                    text: "Recent Transactions",
                    font: .title2.bold()
                ).padding()
                
                Spacer()
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(0 ..< transactions.count, id:\.self) { i in
                            TransactionView(
                                imageName: transactions[i].imageName,
                                payTo: transactions[i].payTo,
                                month: transactions[i].month,
                                day: transactions[i].day,
                                amount: transactions[i].amount,
                                isExpense: transactions[i].isExpense,
                                isSystemIcon: transactions[i].isSystemIcon
                            )
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CreditCardPageView()
}
