//
//  AboutView.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 08.01.26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            darkBackground
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                xView()
                
                AvatarView()
                
                ChoicesView()
                
                Spacer()
            }
        }
    }
}

struct xView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("✕")
                .font(.title)
                .padding()
                .foregroundStyle(fontColor)
                .background(backgroundX)
                .cornerRadius(20)
        }
    }
}

struct AvatarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(fontColor)
                .background(backgroundX)
                .clipShape(Circle())
                
            TextView(text: "Hamed Kharazmi", font: .title)
            TextView(text: "Software Engineer", font: .headline)
        }.padding()
    }
}

struct TextView: View {
    let text: String
    let font: Font
    
    var body: some View {
        Text(text)
            .foregroundColor(fontColor)
            .font(font)
    }
}

struct ChoicesView: View {
    
    let dataArray: [(String, String, String?)] = [
        (title: "Corporate App", systemImage: "building.2", description: nil),
        (title: "Security Settings", systemImage: "lock", description: nil),
        (title: "Online Shopping", systemImage: "cart", description: "Add to cart"),
        (title: "Groceries", systemImage: "list.bullet.rectangle", description: nil),
        (title: "Utilities", systemImage: "wrench.and.screwdriver", description: nil),
        (title: "Thumb Scanner", systemImage: "hand.thumbsup", description: "Scan thumb for identification")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(0..<dataArray.count, id: \.self) { i in
                SingleChoiceView(text: dataArray[i].0, systemImage: dataArray[i].1, description: dataArray[i].2)
            }
        }
    }
}

struct SingleChoiceView: View {
    let text: String
    let systemImage: String
    let description: String?
    
    var body: some View {
        Label(text, systemImage: systemImage)
            .font(.headline)
            .foregroundStyle(fontColor)
            .padding(.horizontal)
            .labelStyle(SpacedLabelStyle())
            .symbolRenderingMode(.hierarchical)
            .accessibilityLabel(description ?? text)
    }
}

struct SpacedLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 20) {
            configuration.icon
                .imageScale(.large)
            configuration.title
        }
    }
}

#Preview {
    AboutView()
}
