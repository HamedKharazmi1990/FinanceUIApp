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
                .frame(width: 50, height: 50)
                .foregroundColor(fontColor)
                .background(backgroundX)
                .clipShape(Circle())
                
            TextView(text: "Hamed Kharazmi", font: .largeTitle)
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

#Preview {
    AboutView()
}
