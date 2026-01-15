//
//  YourBalanceView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 15.01.26.
//

import SwiftUI

struct YourBalanceView: View {
    var body: some View {
        ZStack {
            darkBackground
                .ignoresSafeArea()
            
            VStack {
                HeaderYourBalanceView()
                
                BalanceSubView()
                
                Spacer()
            }
        }
    }
}

struct HeaderYourBalanceView: View {
    var body: some View {
        HStack {
            TextView(text: "1", font: .title)
            Spacer()
            TextView(text: "2", font: .title)
        }.padding()
    }
}

struct BalanceSubView: View {
    var body: some View {
        HStack {
            TextView(text: "Your Balance", font: .title)
            Spacer()
        }.padding()
    }
}

#Preview {
    YourBalanceView()
}
