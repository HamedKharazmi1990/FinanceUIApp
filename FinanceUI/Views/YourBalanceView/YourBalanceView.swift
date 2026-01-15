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
                
                YourBalanceActionsView()
                
                ActivitiesOfTheWeekHeader()
                
                MonthlyExpensesView()
                
                Spacer()
            }
        }
    }
}

struct ActivitiesOfTheWeekHeader: View {
    var body: some View {
        HStack {
            Text("Activities")
                .foregroundStyle(.white)
                .font(.title3.weight(.semibold))
            
            Spacer()
            TextView(text: "This Week", font: .caption)
                .padding(7)
                .padding(.horizontal)
                .background(darkBackground2)
                .clipShape(RoundedRectangle(cornerRadius: 15))
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct YourBalanceActionsView: View {
    let actionList: [(iconName: String, name: String, color: Color)] = [
        (iconName: "arrow.up", name: "Sent", color: .pink),
        (iconName: "arrow.down", name: "Receive", color: .green),
        (iconName: "dollarsign.square", name: "Loan", color: .yellow),
        (iconName: "icloud.and.arrow.up", name: "Topup", color: .blue)
    ]
    var body: some View {
        HStack {
            Spacer()
            ForEach(0 ..< actionList.count, id: \.self) { i in
                ActionView(
                    iconName: actionList[i].iconName,
                    color: actionList[i].color,
                    name: actionList[i].name
                )
                Spacer()
            }
        }.padding()
    }
}

struct ActionView: View {
    let iconName: String
    let color: Color
    let name: String
    
    var body: some View {
        VStack {
            Image(systemName: iconName)
                .foregroundStyle(color)
                .frame(width: 50, height: 50)
                .background(darkBackground2)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            TextView(text: name, font: .body)
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
                        .foregroundStyle(white)
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

struct MonthlyExpensesView: View {
    let barData: [(month: String, percentage: CGFloat)] = [
        (month: "Jan", percentage: 0.67),
        (month: "Feb", percentage: 0.44),
        (month: "Mar", percentage: 0.26),
        (month: "Apr", percentage: 0.88),
        (month: "May", percentage: 0.56),
        (month: "Jun", percentage: 0.14)
    ]
    var body: some View {
        HStack {
            ForEach(barData.indices, id: \.self) { i in
                FillBarView(
                    month: barData[i].month,
                    percentage: barData[i].percentage
                )
            }
        }.padding()
    }
}

#Preview {
    YourBalanceView()
}
