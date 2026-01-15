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
                
                YourBalanceAmountView(
                    month: 1,
                    day: 15,
                    year: 2026,
                    amount: 23806.04,
                    percentage: 15,
                    isUp: true
                )
                
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

struct YourBalanceAmountView: View {
    let month: Int
    let day: Int
    let year: Int
    let amount: Double
    let percentage: Int
    let isUp: Bool
    
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                if month >= 1 && month <= 12 {
                    let cal = Calendar.current
                    let monthName = cal.monthSymbols[month-1]

                    HStack {
                        TextView(text: "\(monthName) \(day), \(year)", font: .caption)
                        Spacer()
                    }
                }
                
                HStack {
                    Text("$\(amount, specifier: "%.2f")")
                        .foregroundStyle(fontColor)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    TextView(text: "\(percentage)%", font: .caption)
                    
                    let imageName = isUp ? "arrow.up" : "arrow.down"
                    Image(systemName: imageName)
                        .foregroundStyle(fontColor)
                        .font(.caption)
                }
            }
        }.padding()
            .background(darkBackground2)
            .cornerRadius(20)
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
