//
//  TextViews.swift
//  FinanceUI
//
//  Created by Hamed Kharazmi on 09.01.26.
//

import SwiftUI

struct TextViewWhite: View {
    let text: String
    let font: Font
    let fontWeight: Font.Weight
    
    var body: some View {
        Text(text)
            .font( font)
            .fontWeight( fontWeight)
            .foregroundColor(white)
            .padding(.horizontal)
    }
}
