//
//  BottomNavigationView.swift
//  TBEmojiPicker
//
//  Created by Taha Bozdemir on 1.05.2023.
//

import SwiftUI

struct BottomNavigationView: View {
    var scrollValue: ScrollViewProxy?
    let bottomNavBar: BottomNavBar
    public var body: some View {
        ZStack {
            HStack{
                ForEach(CategoryType.allCases, id: \.self) { category in
                    Button {
                        withAnimation {
                            scrollValue?.scrollTo(category.rawValue, anchor: .top)
                        }
                    } label: {
                        Image(categoriesSymbol[category.rawValue]!, bundle: Bundle.module)
                            .renderingMode(.template)
                            .font(.system(size: 18))
                            .foregroundColor(bottomNavBar.foregroundColor)
                    }
                    .padding(.horizontal, 8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(
                Rectangle()
                    .fill(bottomNavBar.backgroundColor)
                    .opacity(0.5)
            )
            .cornerRadius(10)
        }
        .padding()
    }
}

