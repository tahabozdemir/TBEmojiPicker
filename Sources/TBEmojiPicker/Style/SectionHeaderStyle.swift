//
//  SectionHeaderStyle.swift
//  TBEmojiPicker
//
//  Created by Taha Bozdemir on 1.05.2023.
//

import SwiftUI

struct SectionHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .textCase(.uppercase)
            .padding()
    }
}
extension Text {
    func sectionHeaderStyle() -> some View {
        modifier(SectionHeaderStyle())
    }
}
