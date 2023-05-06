//
//  EmojiStyle.swift
//  TBEmojiPicker
//
//  Created by Taha Bozdemir on 1.05.2023.
//

import SwiftUI

struct EmojiStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.system(size: 32))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray)
                    .opacity(0.1)
            )
            .cornerRadius(10)
    }
}
extension Text {
    func emojiStyle() -> some View {
        modifier(EmojiStyle())
    }
}
