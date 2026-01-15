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
    let dim: CGFloat = 50
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3.decrease")
                .font(.body.weight(.heavy))
                .frame(width: dim, height: dim)
                .foregroundStyle(fontColor)
            Spacer()
            AvatarDefaultView(dim: 30)
        }.padding()
    }
}

struct AvatarDefaultView: View {
    let dim: CGFloat
    var body: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .frame(width: dim, height: dim)
            .foregroundStyle(fontColor)
            .background(darkBackground2)
            .clipShape(Circle())
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
